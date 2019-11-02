import sys, abc, random, math
from inst_reg import *

target_path = "instructions/"
n = 20

insts = [
    And(), Or(), Xor(), Nor(), Andi(), Ori(), Xori(), Lui(), Sll(), Sra(), Srl(), Sllv(), Srav(), Srlv(),
    Movn(), Movz(), Mfhi(), Mthi(), Mflo(), Mtlo(),
    Add(), Addi(), Addiu(), Addu(), Sub(), Subu(), Slt(), Slti(), Sltiu(), Sltu(), Mul(), Mult(), Multu()
]

def init():
    regs.clear()
    # 32 is hi, 33 is lo
    for i in range(0, 34):
        regs.append(Reg(i))


def main(argv):
    for inst in insts:
        init()

        o = Ori()
        l = Lui()
        head = "    .org 0x0\n    .global _start\n    .set noat\n    .set noreorder\n    .set nomacro\n_start:\n"
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
                    assert p > 0
                    params.append(Imm(p, random.randint(0, 2 ** p - 1)))
            now_string += inst.generate_line(params)
        with open(target_path + "auto_" + inst.name + ".s", 'w') as f:
            f.write(now_string)
            f.flush()


if __name__ == "__main__":
    main(sys.argv[1:])