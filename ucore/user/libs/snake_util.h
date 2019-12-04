//
// Created by Fan Qu on 12/3/19.
//

#ifndef SNAKE_SNAKE_UTIL_H
#define SNAKE_SNAKE_UTIL_H

// #include <stddef.h>
#ifndef ON_X64
#include <ulib.h>
#endif

//#define ON_X64

/**
 * sleep time milliseconds
 * @param time
 * @return
 */
int Sleep(unsigned int time);

// /**
//  * malloc
//  * @param size
//  * @return
//  */
// void* smalloc(size_t size);
// void sfree(void* ptr);

unsigned int get_time_millis();

//get x mod m, use 2 div
int modm(int x, int m);
//get x div m, use 2 div
int divm(int x, int m);

#endif //SNAKE_SNAKE_UTIL_H
