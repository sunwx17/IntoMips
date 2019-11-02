import sys, abc, random, math
from inst_reg import *

target_path = "instructions/"
n = 100

class Imm(object):
    def __init__(self, width, value = 0):
        self.width = width
        self.value = value
        assert width > 0
        assert width < 32
        assert value >= 0
        assert value < 2 ** width 
    
    def getWidth(self):
        return self.width

    def getValue(self):
        return self.value

    def to_string(self):
        return ("0x{:0" + str(math.ceil(self.width / 4)) +  "x}").format(self.value)
    

insts = [Mthi(), And(), Or(), Xor(), Nor(), Andi(), Ori(), Xori(), Lui(), Sll(), Sra(), Srl(), Sllv(), Srav(), Srlv()]

def init():
    regs.clear()
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
            params_lui = [regs[i], Imm(16, random.randint(0, 2 ** 16 - 1))]
            head += l.generate_line(params_lui)
            params_ori = [regs[i], regs[i], Imm(16, random.randint(0, 2 ** 16 - 1))]
            head += o.generate_line(params_ori)

        now_string = head
        for i in range(0, n):
            params = []
            for p in inst.params:
                assert p == 'r' or p > 0 and p < 32
                if (p == 'r'):
                    params.append(regs[random.randint(0, 31)])
                else:
                    params.append(Imm(p, random.randint(0, 2 ** p - 1)))
            now_string += inst.generate_line(params)
        with open(target_path + "auto_" + inst.name + ".s", 'w') as f:
            f.write(now_string)
            f.flush()


if __name__ == "__main__":
    main(sys.argv[1:])