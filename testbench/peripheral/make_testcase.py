# -*- coding: UTF-8 -*-

import sys, getopt, random
def rand_half_word():
    call4 = lambda f, x: f(x) + f(x) + f(x) + f(x)
    return  call4(random.choice, list('0123456789abcdef'))


def usage():
    print('python make_testcase -m <module> -n <test_num>')
    print('       module: flash')
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
    #TODO: sram...

def flash(test_num):
    ans_list = []
    addr = 0
    with open("testcases/flash.mem", "w") as f:
        for _ in range(test_num):
            ans = rand_half_word()
            f.write(ans + "\n")
            ans_list.append("addr:" + str(addr) + "=" + ans)
            addr += 4
    with open("testcases/flash.ans", "w") as f:
        f.write('\n'.join(ans_list))
    
if __name__ == "__main__":
    main(sys.argv[1:])