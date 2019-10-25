import sys, abc, random, math

target_path = "instructions/"
n = 100

class Imm(object):
    def __init__(self, width, value = 0):
        self.width = width
        self.value = value
        assert width > 0 and width < 32 and value >= 0 and value < 2 ** width 
    
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
            self.value = v
            assert v >= 0 and v < 2 ** 32

    def to_string(self):
        if(self.num < 32):
            return "${}".format(self.num)
        elif(self.num == 32):
            return "hi"
        elif(self.num == 33):
            return "lo"
    
    def clear(self):
        self.value = 0

regs = []

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
                ans = "{}=0x{:08x}".format(to_be_writen.to_string(), res)
            else:
                ans = "hi=0x{:08x},lo=0x{:08x}".format(regs[32].getValue(), regs[33].getValue())
        return ans

    def generate_line(self, param_list):
        return "    " + self.name + "  " + ", ".join([p.to_string() for p in param_list]) + "\t\t\t# " + self.generate_ans(param_list) + '\n'
        

class Ori(Inst):
    name = "ori"
    params = ['r', 'r', 16]
    def run(self, param_list):
        return (param_list[0], param_list[1].getValue() | param_list[2].getValue())

class Lui(Inst):
    name = 'lui'
    params = ['r', 16]
    def run(self, param_list):
        return (param_list[0], param_list[1].getValue() << 16)

class Mthi(Inst):
    name = 'mthi'
    params = ['r']
    def run(self, param_list):
        return (regs[32], param_list[0].getValue())


insts = [Ori(), Lui(), Mthi()]

def init():
    # 32 is hi, 33 is lo
    for i in range(0, 34):
        regs.append(Reg(i))


def main(argv):
    

    head = "    .org 0x0\n    .global _start\n    .set noat\n    .set noreorder\n    .set nomacro\n_start:\n"


    for inst in insts:
        regs.clear()
        init()

        o = Ori()
        l = Lui()
        for i in range(0, 32):
            params_lui = [regs[i], Imm(16, random.randint(0, 2 ** 16))]
            head += l.generate_line(params_lui)
            params_ori = [regs[i], regs[i], Imm(16, random.randint(0, 2 ** 16))]
            head += o.generate_line(params_ori)

        now_string = head
        for i in range(0, n):
            params = []
            for p in inst.params:
                assert p == 'r' or p > 0 and p < 32
                if (p == 'r'):
                    params.append(regs[random.randint(0, 31)])
                else:
                    params.append(Imm(p, random.randint(0, 2 ** p)))
            now_string += inst.generate_line(params)
        with open(target_path + "auto_" + inst.name + ".s", 'w') as f:
            f.write(now_string)
            f.flush()


if __name__ == "__main__":
    main(sys.argv[1:])