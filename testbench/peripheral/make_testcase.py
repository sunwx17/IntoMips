# -*- coding: UTF-8 -*-

import sys, getopt, random

def rand_byte():
    call2 = lambda f, x: f(x) + f(x)
    return  call2(random.choice, list('0123456789abcdef'))

def rand_half_word():
    call4 = lambda f, x: f(x) + f(x) + f(x) + f(x)
    return  call4(random.choice, list('0123456789abcdef'))


def usage():
    print('python make_testcase -m <module> -n <test_num>')
    print('       module: flash, sram')
    print('       test_num: (default = 10)')

def main(argv):
    #根据参数生成对应testcase
    module = ""
    test_num = 10
    try:
        opts, _ = getopt.getopt(argv, "hm:n:",["help", "module", "test_num"])
    except getopt.GetoptError:
        usage()
        sys.exit()
    for opt, arg in opts:
        if opt in ("-h", "--help"):
            usage()
            sys.exit()
        elif opt in ("-m", "--module"):
            module = arg
        elif opt in ("-n", "--test_num"):
            test_num = int(arg)
        else:
            print("unexpected args")
            usage()
            sys.exit()
    
    #print(module, test_num)
    if module == "flash":
        flash(test_num)
    if module == "sram":
        sram(test_num)

def flash(test_num):
    ans_list = []
    addr = 0
    with open("testcases/flash.mem", "w") as f:
        for _ in range(test_num):
            ans0 = rand_half_word()
            ans1 = rand_half_word()
            f.write(ans0 + "\n")
            f.write(ans1 + "\n")
            ans_list.append("addr:" + str(addr) + "=" + ans1 + ans0)
            addr += 4 
    with open("testcases/flash.ans", "w") as f:
        for ans in ans_list:
            f.write(ans + "\n")

def sram(test_num):
    sram_read(test_num)
    sram_write(test_num)
    
def sram_write(test_num):
    addr = 0
    with open("testcases/sram_write.mem", "w") as f:
        for _ in range(test_num):
            ans = rand_byte()
            f.write(ans + "\n")
            ans = rand_byte()
            f.write(ans + "\n")
            ans = rand_byte()
            f.write(ans + "\n")
            ans = rand_byte()
            f.write(ans + "\n")
    addr = 0
    with open("testcases/sram_write.ans", "w") as f:
        for _ in range(test_num):
            tmp = []
            ans = rand_byte()
            tmp.append(ans)
            ans = rand_byte()
            tmp.append(ans)
            ans = rand_byte()
            tmp.append(ans)
            ans = rand_byte()
            tmp.append(ans)
            tmp.reverse()
            f.write("write addr:" + str(addr) + "=" + ''.join(tmp) + "\n")
            addr += 4

def sram_read(test_num):
    ans_list = []
    addr = 0
    with open("testcases/sram_read.mem", "w") as f:
        for _ in range(test_num):
            tmp = []
            ans = rand_byte()
            f.write(ans + "\n")
            tmp.append(ans)
            ans = rand_byte()
            f.write(ans + "\n")
            tmp.append(ans)
            ans = rand_byte()
            f.write(ans + "\n")
            tmp.append(ans)
            ans = rand_byte()
            f.write(ans + "\n")
            tmp.append(ans)
            tmp.reverse()
            ans_list.append("read addr:" + str(addr) + "=" + ''.join(tmp))
            addr += 4 
    with open("testcases/sram_read.ans", "w") as f:
        for ans in ans_list:
            f.write(ans + "\n")
    
if __name__ == "__main__":
    main(sys.argv[1:])