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

// when use *nix x64, use ON_X64 macro
//#define ON_X64

// when USE_ARROW_KEY is uncommented, use arrow key to control; else use wsad to control
// #define USE_ARROW_KEY

#define SHOW_VGA

// #define DEBUG_LOG

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
