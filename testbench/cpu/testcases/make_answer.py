# -*- coding: UTF-8 -*-

import sys, getopt

def main(argv):
    inputfile = ''
    outputfile = ''
    try:
        opts, _ = getopt.getopt(argv,"hi:o:",["ifile=","ofile="])
    except getopt.GetoptError:
        print ('test.py -i <inputfile> -o <outputfile>')
        sys.exit(2)
    for opt, arg in opts:
        if opt == '-h':
            print ('test.py -i <inputfile> -o <outputfile>')
            sys.exit()
        elif opt in ("-i", "--ifile"):
            inputfile = arg
        elif opt in ("-o", "--ofile"):
            outputfile = arg
    answer = ''
    with open(inputfile, 'r') as f:
        lines = f.readlines()
        count = 0
        m = {}
        for line in lines:
            if '#' in line:
                count = count + 1
                ans = line.strip().split(' ')[-1]
                if ':' in line:
                    temp = ans.split(':')
                    num = int(temp[0])
                    m[num] = temp[1]
                else:
                    m[count] = ans
                #print(line)
        for i in range(1, count + 1):
            answer += str(i) + ':' + m[i].strip() + '\n'
    with open(outputfile, 'w', newline='\n') as f:
        f.write(answer)

if __name__ == "__main__":
    main(sys.argv[1:])
