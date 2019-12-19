//
// Created by Fan Qu on 12/3/19.
//
//This file is used for the state machine of the game, including data handling

#ifndef SNAKE_GAMEMANAGER_H
#define SNAKE_GAMEMANAGER_H

//initialize game with default width and height
void default_init_game();

// width and height must in valid range
void init_game(int width, int height);

//get map, map[i][j] = 1 stands for the food, 2 stands for the snake, 0 for empty
void get_map(unsigned char **map_ptr);

int get_height();

int get_width();

int get_score();

int get_round_num();

//free the memory
void end_game();


//in each logical frame, this function should be used to update the state
// direction: 0,1,2,3 stands for up, right, down, left; -1 stands for the origin direction
void update_game(int direction);

// 1 for over, 0 for not
int is_game_over();



#endif //SNAKE_GAMEMANAGER_H
