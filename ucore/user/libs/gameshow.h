//
// Created by Fan Qu on 12/3/19.
//

#ifndef SNAKE_GAMESHOW_H
#define SNAKE_GAMESHOW_H

#include "snake_util.h"

char* read_line(int timeout);

void test_input();

void begin_game();

void multi_begin_game();

#ifdef SHOW_VGA
void test_vga_color();
#endif

#endif //SNAKE_GAMESHOW_H
