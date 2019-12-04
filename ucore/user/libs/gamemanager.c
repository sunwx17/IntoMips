//
// Created by Fan Qu on 12/3/19.
//

#include "gamemanager.h"

// #include <stddef.h>
#include <stdlib.h>
#include <ulib.h>
#include <string.h>
#include <stdio.h>

#include "snake_util.h"

#define DEFAULT_WIDTH 20
#define DEFAULT_HEIGHT 20
#define MIN_WIDTH 3
#define MIN_HEIGHT 3
#define MAX_WIDTH 100
#define MAX_HEIGHT 100

#define INIT_SNAKE_LEN 1
#define INIT_DIRECTION 0



struct GameData{
    // size of the map
    int width, height;
    int snake_len;
    // 0,1,2,3 stands for up, right, down and left; -1 stands for none
    int direction;

    // snake's position, x is the row, y is the col, origin is the left-up point
    // x_pos[0] is head's x
    int x_pos[MAX_HEIGHT], y_pos[MAX_WIDTH];

    //map[i][j] = 1 stands for the food, 2 stands for the snake, 0 for empty
    unsigned char map[MAX_HEIGHT * MAX_WIDTH];

    // temporary x_pos and y_pos, for saving-time of alloc
//    int *temp_x, *temp_y;

    // position of food
    int food_x, food_y;

    // number of rounds, every move is one round
    int rounds;
    int score;

    // 0 when not over, 1 when over
    int game_over;

};

static struct GameData* data_ptr = NULL;
static struct GameData m_game_data;

static const int ux[4] = {-1, 0, 1, 0}, uy[4] = {0, 1, 0, -1};


void free_data()
{
    // sfree(data_ptr->x_pos);
    // sfree(data_ptr->y_pos);
    int i;
    // for(i = 0; i < data_ptr->height; ++i)
    //     sfree(data_ptr->map[i]);
    // sfree(data_ptr->map);
//    sfree(ptr->temp_x);
//    sfree(ptr->temp_y);
    // sfree(data_ptr);
    data_ptr = NULL;
}

void end_game()
{
    free_data();
}

int is_food_in_snake()
{
    int i;
    for(i = 0; i < data_ptr->snake_len; ++i) {
        if(data_ptr->food_x == data_ptr->x_pos[i] && data_ptr->food_y == data_ptr->y_pos[i])
            return 1;
    }
    return 0;
}

void get_new_food()
{
    do {
        data_ptr->food_x = modm(rand() , data_ptr->height);
        data_ptr->food_y = modm(rand() , data_ptr->width);
    }while(is_food_in_snake());
}

int map_i(int i, int j)
{
    return i * data_ptr->width + j;
}

void fill_map()
{
//    memset(data_ptr->map, 0, data_ptr->width * data_ptr->height * sizeof(data_ptr->map[0][0]));
    // int i;
    // for(i = 0; i < data_ptr->height; ++i) {
    //     memset(data_ptr->map[i], 0, data_ptr->width * sizeof(char));
    // }
    memset(data_ptr->map, 0, sizeof(data_ptr->map));
    data_ptr->map[map_i(data_ptr->food_x,data_ptr->food_y)] = 1;
    int i;
    for(i = 0; i < data_ptr->snake_len; ++i) {
        data_ptr->map[map_i(data_ptr->x_pos[i], data_ptr->y_pos[i])] = 2;
    }
}

void get_map(unsigned char **map_ptr)
{
    *map_ptr = data_ptr->map;
}

int get_width()
{
    return data_ptr->width;
}

int get_height()
{
    return data_ptr->height;
}

int get_round_num()
{
    return data_ptr->rounds;
}

int get_score()
{
    return data_ptr->score;
}

int map_x(int x)
{
    return modm((x + data_ptr->height) , data_ptr->height);
}

int map_y(int y)
{
    return modm((y + data_ptr->width) , data_ptr->width);
}

// This function should be called before food is assigned
// before this function is called, height, width and snake_len should be assigned
void generate_new_snake()
{
    if(data_ptr->snake_len > 0) {
        data_ptr->x_pos[0] = modm(rand() , data_ptr->height);
        data_ptr->y_pos[0] = modm(rand() , data_ptr->width);
    }
    int i;
    for(i = 1; i < data_ptr->snake_len; ++i) {
        int dir = modm(rand() , 4);
        data_ptr->x_pos[i] = map_x(data_ptr->x_pos[i-1] + ux[dir]);
        data_ptr->y_pos[i] = map_y(data_ptr->y_pos[i-1] + uy[dir]);
    }
}

// width and height must in valid range
void init_game(int width, int height)
{
    srand(height * width);
    if(data_ptr != NULL) {
        free_data();
    }
    // data_ptr = smalloc(sizeof(struct GameData));
    data_ptr = &m_game_data;
    data_ptr->width = width;
    data_ptr->height = height;
    data_ptr->snake_len = INIT_SNAKE_LEN;
    data_ptr->direction = INIT_DIRECTION;
    int max_len = width * height;
    // data_ptr->x_pos = smalloc(max_len * sizeof(int));
    // data_ptr->y_pos = smalloc(max_len * sizeof(int));
    // data_ptr->map = smalloc(data_ptr->height * sizeof(char *));
    int i;
    // for(i = 0; i < data_ptr->height; ++i) {
    //     data_ptr->map[i] = smalloc(data_ptr->width * sizeof(char));
    // }

//    data_ptr->temp_x = smalloc(max_len * sizeof(int));
//    data_ptr->temp_y = smalloc(max_len * sizeof(int));

    generate_new_snake();
    get_new_food();

    fill_map();

    data_ptr->rounds = 0;
    data_ptr->score = 0;
    data_ptr->game_over = 0;
}

//initialize game with default width and height
void default_init_game()
{
    init_game(DEFAULT_WIDTH, DEFAULT_HEIGHT);
}



int will_eat_next_step(int direction)
{
    int dir = direction;
    if(dir == -1)
        dir = data_ptr->direction;
    int x = map_x(data_ptr->x_pos[0] + ux[dir]);
    int y = map_y(data_ptr->y_pos[0] + uy[dir]);
    if(x == data_ptr->food_x && y == data_ptr->food_y)
        return 1;
    return 0;
}

void game_win()
{

}

int is_struck()
{
    int len = data_ptr->snake_len;
    if(len > 1) {
        int i;
        for(i = 1; i < len; ++i) {
            if(data_ptr->x_pos[0] == data_ptr->x_pos[i] && data_ptr->y_pos[0] == data_ptr->y_pos[i])
                return 1;
        }
    }
    return 0;
}

// 1 for over, 0 for not
int is_game_over()
{
    if(data_ptr != NULL)
        return data_ptr->game_over;
    else
        return 1;
}

int is_dir_opposite(int dir1, int dir2) {
    return ((dir1 + dir2) & 1 ) == 0;
}

// direction: 0,1,2,3 stands for up, right, down, left; -1 stands for the origin direction
void update_game(int direction)
{
    if(!is_game_over()) {
        int old_direction = data_ptr->direction;
        int dir_changed = 0;
        if (direction >= 0 && direction <= 3) {
            if (direction != old_direction) {
                dir_changed = 1;
                data_ptr->direction = direction;
            }
        }
        if (!dir_changed)
            direction = old_direction;
        else {
            if(is_dir_opposite(old_direction, direction))
                return;
        }
        if (will_eat_next_step(direction)) {
            if (data_ptr->snake_len == data_ptr->width * data_ptr->height - 1) {
                game_win();
            } else {
                int i;
                for(i = data_ptr->snake_len; i > 0; --i) {
                    data_ptr->x_pos[i] = data_ptr->x_pos[i - 1];
                    data_ptr->y_pos[i] = data_ptr->y_pos[i - 1];
                }
                data_ptr->x_pos[0] = map_x(data_ptr->x_pos[0] + ux[direction]);
                data_ptr->y_pos[0] = map_y(data_ptr->y_pos[0] + uy[direction]);
                data_ptr->snake_len++;
                data_ptr->score++;
                data_ptr->rounds++;
                get_new_food();
            }
        } else {
            int i;
            for (i = data_ptr->snake_len - 1; i > 0; --i) {
                data_ptr->x_pos[i] = data_ptr->x_pos[i - 1];
                data_ptr->y_pos[i] = data_ptr->y_pos[i - 1];
            }
            data_ptr->x_pos[0] = map_x(data_ptr->x_pos[0] + ux[direction]);
            data_ptr->y_pos[0] = map_y(data_ptr->y_pos[0] + uy[direction]);
            data_ptr->rounds++;
        }
        if (is_struck())
            data_ptr->game_over = 1;
        fill_map();
    }
}