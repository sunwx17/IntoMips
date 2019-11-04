import abc
import math

HI_REG = 32
LO_REG = 33

regs = []

def constrain(v):
    return v & 0xffffffff

def zero_extend_16_to_32(v):
    assert v >= 0
    assert v < 2 ** 16
    return v

def ari_extend_16_to_32(v):
    assert v >= 0
    assert v < 2 ** 16
    v = "{:016b}".format(v)
    v = (v[0] * 16) + v
    v = int(v, 2)
    assert v >= 0
    assert v < 2 ** 32
    return v

    
#all value is positive(stored as 32-bit)
class Imm(object):
    def __init__(self, width, value = 0):
        self.width = width
        self.value = value
        assert width > 0
        assert width < 32
        assert value >= 0
        assert value <= 2 ** width - 1
    
    def getWidth(self):
        return self.width

    def getValue(self):
        return self.value

    def to_string(self):
        return ("0x{:0" + str(math.ceil(self.width / 4)) +  "x}").format(self.value)
       

class Reg(object):
    def __init__(self, num ,value = 0):
        self.num = num
        self.value = value
        assert num >= 0 and num < 34 and value >= 0 and value < 2 ** 32
    
    def getNum(self):
        return self.num

    def getValue(self):
        return self.value
    
    def setValue(self, v):
        if(self.num != 0):
            assert v >= 0
            assert v < 2 ** 32
            self.value = v

    def to_string(self):
        if(self.num < 32):
            return "${}".format(self.num)
        elif(self.num == 32):
            return "hi"
        elif(self.num == 33):
            return "lo"
    
    def clear(self):
        self.value = 0



class Inst(object):
    name = 'nop'
    num_of_param = 0
    params = []

    @abc.abstractmethod
    def run(self, param_list):
        pass

    def generate_ans(self, param_list):
        ans = ""
        to_be_written, res, to_be_written_another, res_another = self.run(param_list)
        if (to_be_written == -1):
            ans = "skip"
        else:
            to_be_written.setValue(res)
            if to_be_written_another != -1:
                assert to_be_written.getNum() >= 32
                assert to_be_written_another.getNum() >= 32
                to_be_written_another.setValue(res_another)

            if(to_be_written.getNum() < 32):
                ans = "{}=0x{:08x}".format(to_be_written.to_string(), res)
            else:
                ans = "hi=0x{:08x},lo=0x{:08x}".format(regs[32].getValue(), regs[33].getValue())
        return ans

    def generate_line(self, param_list):
        return "    " + self.name + "  " + ", ".join([p.to_string() for p in param_list]) + "\t\t\t# " + self.generate_ans(param_list) + '\n'
        

'''logial and shift instructions'''
#and, or, xor, nor, andi, ori, xori, lui, sll, sra, srl, sllv, srav, srlv, nop
class And(Inst):
    name = 'and'
    params = ['r', 'r', 'r']
    def run(self, param_list):
        ans = param_list[1].getValue() & param_list[2].getValue()
        return (param_list[0], constrain(ans), -1, 0)

class Or(Inst):
    name = 'or'
    params = ['r', 'r', 'r']
    def run(self, param_list):
        ans = param_list[1].getValue() | param_list[2].getValue()
        return (param_list[0], constrain(ans), -1, 0)

class Xor(Inst):
    name = 'xor'
    params = ['r', 'r', 'r']
    def run(self, param_list):
        ans = param_list[1].getValue() ^ param_list[2].getValue()
        return (param_list[0], constrain(ans), -1, 0)

class Nor(Inst):
    name = 'nor'
    params = ['r', 'r', 'r']
    def run(self, param_list):
        ans = ~(param_list[1].getValue() | param_list[2].getValue())
        return (param_list[0], constrain(ans), -1, 0)

class Andi(Inst):
    name = 'andi'
    params = ['r', 'r', 16]
    #zero_extend
    def run(self, param_list):
        assert param_list[2].getValue() >= 0
        assert param_list[2].getValue() < 2 ** 16
        ans = param_list[1].getValue() & param_list[2].getValue()
        return (param_list[0], constrain(ans), -1, 0)

class Ori(Inst):
    name = "ori"
    params = ['r', 'r', 16]
    #zero_extend
    def run(self, param_list):
        assert param_list[2].getValue() >= 0
        assert param_list[2].getValue() < 2 ** 16
        ans = param_list[1].getValue() | param_list[2].getValue()
        return (param_list[0], constrain(ans), -1, 0)

class Xori(Inst):
    name = 'xori'
    params = ['r', 'r', 16]
    #zero_extend
    def run(self, param_list):
        assert param_list[2].getValue() >= 0
        assert param_list[2].getValue() < 2 ** 16
        ans = param_list[1].getValue() ^ param_list[2].getValue()
        return (param_list[0], constrain(ans), -1, 0)

class Lui(Inst):
    name = 'lui'
    params = ['r', 16]
    def run(self, param_list):
        assert param_list[1].getValue() >= 0
        assert param_list[1].getValue() < 2 ** 16
        ans = param_list[1].getValue() << 16
        return (param_list[0], constrain(ans), -1, 0)

class Sll(Inst):
    name = 'sll'
    params = ['r', 'r', 5]
    def run(self, param_list):
        assert param_list[2].getValue() >= 0
        assert param_list[2].getValue() < 2 ** 5
        ans = param_list[1].getValue() << param_list[2].getValue()
        return (param_list[0], constrain(ans), -1, 0)

class Sra(Inst):
    name = 'sra'
    params = ['r', 'r', 5]
    def run(self, param_list):
        assert param_list[2].getValue() >= 0
        assert param_list[2].getValue() < 2 ** 5

        ans = "{:032b}".format(param_list[1].getValue())
        ans = (ans[0] * param_list[2].getValue()) + ans[:32 - param_list[2].getValue()]
        ans = int(ans, 2)
        assert ans >= 0
        assert ans < 2 ** 32
        return (param_list[0], ans, -1, 0)

class Srl(Inst):
    name = 'srl'
    params = ['r', 'r', 5]
    def run(self, param_list):
        assert param_list[2].getValue() >= 0
        assert param_list[2].getValue() < 2 ** 5
        ans = param_list[1].getValue() >> param_list[2].getValue()
        return (param_list[0], constrain(ans), -1, 0)

class Sllv(Inst):
    name = 'sllv'
    params = ['r', 'r', 'r']
    def run(self, param_list):
        ans = param_list[1].getValue() << (param_list[2].getValue() & 0b11111)
        return (param_list[0], constrain(ans), -1, 0)

class Srav(Inst):
    name = 'srav'
    params = ['r', 'r', 'r']
    def run(self, param_list):
        n = param_list[2].getValue() & 0b11111
        ans = "{:032b}".format(param_list[1].getValue())
        ans = (ans[0] * n) + ans[:32 - n]
        ans = int(ans, 2)
        return (param_list[0], constrain(ans), -1, 0)

class Srlv(Inst):
    name = 'srlv'
    params = ['r', 'r', 'r']
    def run(self, param_list):
        return (param_list[0], param_list[1].getValue() >> (param_list[2].getValue() & 0b11111), -1, 0)




'''move instructions and hilo registers'''
class Movn(Inst):
    name = 'movn'
    params = ['r', 'r', 'r']
    def run(self, param_list):
        if param_list[2].getValue() != 0:
            return (param_list[0], param_list[1].getValue(), -1, 0)
        else:
            return (-1, param_list[0].getValue(), -1, 0)

class Movz(Inst):
    name = 'movz'
    params = ['r', 'r', 'r']
    def run(self, param_list):
        if param_list[2].getValue() == 0:
            return (param_list[0], param_list[1].getValue(), -1, 0)
        else:
            return (-1, param_list[0].getValue(), -1, 0)
    
class Mfhi(Inst):
    name = 'mfhi'
    params = ['r']
    def run(self, param_list):
        return (param_list[0], regs[HI_REG].getValue(), -1, 0)

class Mthi(Inst):
    name = 'mthi'
    params = ['r']
    def run(self, param_list):
        return (regs[HI_REG], param_list[0].getValue(), -1, 0)

class Mflo(Inst):
    name = 'mflo'
    params = ['r']
    def run(self, param_list):
        return (param_list[0], regs[LO_REG].getValue(), -1, 0)

class Mtlo(Inst):
    name = 'mtlo'
    params = ['r']
    def run(self, param_list):
        return (regs[LO_REG], param_list[0].getValue(), -1, 0)


'''arithmetic instructions'''
class Add(Inst):
    #TODO: consider exception?
    name = 'add'
    params = ['r', 'r', 'r']
    def run(self, param_list):
        ans = param_list[1].getValue() + param_list[2].getValue()
        return (param_list[0], constrain(ans), -1, 0)

class Addi(Inst):
    #it will trap when overflow
    #TODO: consider exception?
    name = 'addi'
    params = ['r', 'r', 16]
    #sign extend
    def run(self, param_list):
        ans = param_list[1].getValue() + ari_extend_16_to_32(param_list[2].getValue())
        return (param_list[0], constrain(ans), -1, 0)

class Addiu(Inst):
    #not trap
    name = 'addiu'
    params = ['r', 'r', 16]
    #sign extend
    def run(self, param_list):
        ans = param_list[1].getValue() + ari_extend_16_to_32(param_list[2].getValue())
        return (param_list[0], constrain(ans), -1, 0)

class Addu(Inst):
    #not trap
    name = 'addu'
    params = ['r', 'r', 'r']
    def run(self, param_list):
        ans = param_list[1].getValue() + param_list[2].getValue()
        return (param_list[0], constrain(ans), -1, 0)

class Sub(Inst):
    #TODO: consider exception?
    name = 'sub'
    params = ['r', 'r', 'r']
    def run(self, param_list):
        ans = param_list[1].getValue() - param_list[2].getValue()
        return (param_list[0], constrain(ans), -1, 0)

class Subu(Inst):
    name = 'subu'
    params = ['r', 'r', 'r']
    def run(self, param_list):
        ans = param_list[1].getValue() - param_list[2].getValue()
        return (param_list[0], constrain(ans), -1, 0)

class Slt(Inst):
    name = 'slt'
    params = ['r', 'r', 'r']
    def run(self, param_list):
        #compare as signed
        lhs = param_list[1].getValue()
        rhs = param_list[2].getValue()
        if lhs >= 0x80000000:
            lhs = ((~lhs) & 0xffffffff) + 1
            lhs = -lhs
        if rhs >= 0x80000000:
            rhs = ((~rhs) & 0xffffffff) + 1
            rhs = -rhs
        if lhs < rhs:
            return (param_list[0], 1, -1, 0)
        else:
            return (param_list[0], 0, -1, 0)

class Slti(Inst):
    name = 'slti'
    params = ['r', 'r', 16]
    #sign extend for imm
    def run(self, param_list):
        rhs = ari_extend_16_to_32(param_list[2].getValue())
        lhs = param_list[1].getValue()
        if lhs >= 0x80000000:
            lhs = ((~lhs) & 0xffffffff) + 1
            lhs = -lhs
        if rhs >= 0x80000000:
            rhs = ((~rhs) & 0xffffffff) + 1
            rhs = -rhs
        if lhs < rhs:
            return (param_list[0], 1, -1, 0)
        else:
            return (param_list[0], 0, -1, 0)

class Sltiu(Inst):
    name = 'sltiu'
    params = ['r', 'r', 16]
    #compare as unsigned integers
    #sign extend
    def run(self, param_list):
        rhs = ari_extend_16_to_32(param_list[2].getValue())
        if param_list[1].getValue() < rhs:
            return (param_list[0], 1, -1, 0)
        else:
            return (param_list[0], 0, -1, 0)

class Sltu(Inst):
    name = 'sltu'
    params = ['r', 'r', 'r']
    #compare as unsigned integers
    def run(self, param_list):
        if param_list[1].getValue() < param_list[2].getValue():
            return (param_list[0], 1, -1, 0)
        else:
            return (param_list[0], 0, -1, 0)

class Mul(Inst):
    name = 'mul'
    params = ['r', 'r', 'r']
    def run(self, param_list):
        ans = param_list[1].getValue() * param_list[2].getValue()
        return (param_list[0], constrain(ans), -1, 0)

class Mult(Inst):
    name = 'mult'
    params = ['r', 'r']
    def run(self, param_list):
        lhs = param_list[0].getValue()
        rhs = param_list[1].getValue()

        sign = False
        if lhs >= 0x80000000:
            lhs = ((~lhs) & 0xffffffff) + 1
            sign = not sign
        if rhs >= 0x80000000:
            rhs = ((~rhs) & 0xffffffff) + 1
            sign = not sign
        ans = lhs * rhs
        if sign: ans = -ans
        ans = ans & 0xffffffffffffffff
        lo = ans & 0xffffffff
        hi = (ans >> 32) & 0xffffffff
        return (regs[LO_REG], constrain(lo), regs[HI_REG], constrain(hi))

class Multu(Inst):
    name = 'multu'
    params = ['r', 'r']
    def run(self, param_list):
        ans = "{:064b}".format(param_list[0].getValue() * param_list[1].getValue())
        lo = int(ans[32:], 2)
        hi = int(ans[:32], 2)
        return (regs[LO_REG], constrain(lo), regs[HI_REG], constrain(hi))
