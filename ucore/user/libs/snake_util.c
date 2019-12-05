//
// Created by Fan Qu on 12/3/19.
//
#include "snake_util.h"

#ifdef ON_X64
#include <stdlib.h>
#include <unistd.h>
#include <time.h>
#include <math.h>
#else
#include <ulib.h>
#endif

#include <stdio.h>


int Sleep(unsigned int time)
{
#ifdef ON_X64
    return usleep(time * 1000);
#else
    return sleep(time);
#endif
}

// void* smalloc(size_t size)
// {
// #ifdef ON_X64
//     return malloc(size);
// #else
//     return kmalloc(size);
// #endif
// }

// void sfree(void* ptr)
// {
// #ifdef ON_X64
//     free(ptr);
// #else
//     kfree(ptr);
// #endif
// }

#ifdef ON_X64

unsigned int ts_to_mesc(struct timespec ts)
{
    unsigned int mesc = (ts.tv_sec % 100000000) * 1000 + ts.tv_nsec / 1000000;
    return mesc;
}

#endif

unsigned int get_time_millis() {

#ifdef ON_X64
//    static unsigned int count  = 0;
//    static struct timespec ;
//    count++;
//    if(count == 1)
//        c0 = clock();
//    clock_t c1 = clock();
//    unsigned int mesc = round((double)(c1 - c0) * 1000 / CLOCKS_PER_SEC);
//    return mesc;
    struct timespec ts;
    clock_gettime(CLOCK_REALTIME, &ts);
    return ts_to_mesc(ts);
#else
    return gettime_msec();
#endif
}

int put_c(int ch) {
#ifdef ON_X64
    putchar(ch);
#else
    fprintf(1, "%c", ch);
#endif
}

