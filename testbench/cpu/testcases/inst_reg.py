import abc

regs = []

def get_hex(v):
    return '0x' + hex(v % (1 << 32))[2:].zfill(8)

def srl(v, n):
    #there is not a built-in operator for logical right shift in python :(
    return (v % (1 << 32)) >> n


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
            self.value = v
            #assert v >= 0 and v < 2 ** 32
            #should consider as 32-unsigned
            assert int(get_hex(v), 16) < 2 ** 32

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
        to_be_writen, res = self.run(param_list)
        if (to_be_writen == -1):
            ans = "skip"
        else:
            to_be_writen.setValue(res)
            if(to_be_writen.getNum() < 32):
                ans = "{}={}".format(to_be_writen.to_string(), get_hex(res))
            else:
                ans = "hi={},lo={}".format(get_hex(regs[32].getValue()), get_hex(regs[33].getValue()))
        return ans

    def generate_line(self, param_list):
        return "    " + self.name + "  " + ", ".join([p.to_string() for p in param_list]) + "\t\t\t# " + self.generate_ans(param_list) + '\n'
        
class Mthi(Inst):
    name = 'mthi'
    params = ['r']
    def run(self, param_list):
        return (regs[32], param_list[0].getValue())

'''logial and shift instructions'''
#and, or, xor, nor, andi, ori, xori, lui, sll, sra, srl, sllv, srav, srlv, nop
class And(Inst):
    name = 'and'
    params = ['r', 'r', 'r']
    def run(self, param_list):
        return (param_list[0], param_list[1].getValue() & param_list[2].getValue())

class Or(Inst):
    name = 'or'
    params = ['r', 'r', 'r']
    def run(self, param_list):
        return (param_list[0], param_list[1].getValue() | param_list[2].getValue())

class Xor(Inst):
    name = 'xor'
    params = ['r', 'r', 'r']
    def run(self, param_list):
        return (param_list[0], param_list[1].getValue() ^ param_list[2].getValue())

class Nor(Inst):
    name = 'nor'
    params = ['r', 'r', 'r']
    def run(self, param_list):
        return (param_list[0], ~(param_list[1].getValue() | param_list[2].getValue()))

class Andi(Inst):
    name = 'andi'
    params = ['r', 'r', 16]
    def run(self, param_list):
        return (param_list[0], param_list[1].getValue() & param_list[2].getValue())

class Ori(Inst):
    name = "ori"
    params = ['r', 'r', 16]
    def run(self, param_list):
        return (param_list[0], param_list[1].getValue() | param_list[2].getValue())

class Xori(Inst):
    name = 'xori'
    params = ['r', 'r', 16]
    def run(self, param_list):
        return (param_list[0], param_list[1].getValue() ^ param_list[2].getValue())

class Lui(Inst):
    name = 'lui'
    params = ['r', 16]
    def run(self, param_list):
        return (param_list[0], param_list[1].getValue() << 16)

class Sll(Inst):
    name = 'sll'
    params = ['r', 'r', 5]
    def run(self, param_list):
        return (param_list[0], param_list[1].getValue() << param_list[2].getValue())

class Sra(Inst):
    name = 'sra'
    params = ['r', 'r', 5]
    def run(self, param_list):
        return (param_list[0], param_list[1].getValue() >> param_list[2].getValue())

class Srl(Inst):
    name = 'srl'
    params = ['r', 'r', 5]
    def run(self, param_list):
        return (param_list[0], srl(param_list[1].getValue(), param_list[2].getValue()))

class Sllv(Inst):
    name = 'sllv'
    params = ['r', 'r', 'r']
    def run(self, param_list):
        return (param_list[0], param_list[1].getValue() << (param_list[2].getValue() & 0b11111))

class Srav(Inst):
    name = 'srav'
    params = ['r', 'r', 'r']
    def run(self, param_list):
        return (param_list[0], param_list[1].getValue() >> (param_list[2].getValue() & 0b11111))

class Srlv(Inst):
    name = 'srlv'
    params = ['r', 'r', 'r']
    def run(self, param_list):
        return (param_list[0], srl(param_list[1].getValue(), param_list[2].getValue() & 0b11111))
'''
#nop
'''