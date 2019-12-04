//
// Created by Fan Qu on 12/3/19.
//

#ifndef SNAKE_SNAKE_UTIL_H
#define SNAKE_SNAKE_UTIL_H

// #include <stddef.h>
#include "div.h"
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


#endif //SNAKE_SNAKE_UTIL_H
