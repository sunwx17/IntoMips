//
// Created by Fan Qu on 12/4/19.
//

#include "div.h"

unsigned int modm(unsigned int x, unsigned int m)
{
    unsigned int base = m;
    while(x >= base << 1)
        base <<= 1;
    while(base >= m) {
        if(x >= base) {
            x -= base;
        }
        base >>= 1;
    }
    return x;
}

unsigned int divm(unsigned int x, unsigned int m)
{
    unsigned int n = 1, base = m, ret = 0;
    while(x >= base << 1) {
        base <<= 1;
        n <<= 1;
    }
    while(base >= m) {
        if(x >= base) {
            x -= base;
            ret += n;
        }
        base >>= 1;
        n >>= 1;
    }
    return ret;
}