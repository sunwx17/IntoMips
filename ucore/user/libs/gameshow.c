//
// Created by Fan Qu on 12/3/19.
//

#include "gameshow.h"
#include "gamemanager.h"

#define printf(...)                     fprintf(1, __VA_ARGS__)

#include <stdio.h>
#ifdef ON_X64
#include <unistd.h>
#include <stdlib.h>
#else
#include <ulib.h>
#endif

#include <string.h>
#include "snake_util.h"

#ifdef SHOW_VGA
#include <vga.h>

// light green color
// 0x1 橘黄
// 0x2 shi黄
// 0x3 yellow
// 230 some green
// with bg = 0xf, fg = 0xf, blue


static const int lgreen = 227;
static const int lwhite = 0xf;
static const int bgreen = 61;
#endif

#define BUF_SIZE 4096


// timeout for timeout milliseconds
char* read_line(int timeout)
{
    static char buf[BUF_SIZE];
    int ret = 0, i = 0;
    unsigned int t0 = get_time_millis();
#ifdef ON_X64
    system("/bin/stty raw");
#endif
    while(1) {
        char ch;
#ifdef ON_X64
        if((ret = fread(&ch, sizeof(char), 1, stdin)) < 0)
#else
        if((ret = read(0, &ch, sizeof(char))) < 0)
#endif
            return NULL;

        else if(ret == 0) {
            if(i > 0) {
                buf[i] = '\0';
                break;
            }
            return NULL;
        }
        else if (i < BUF_SIZE - 1) {

//            if(ch == 'A' && i > 0 && buf[i - 1] == '[') {
////                printf("up");
//                buf[i++] = ch;
//            }
//            else {
//                buf[i++] = ch;
////                putc(ch, stdout);
//            }
            buf[i++] = ch;
//            printf("%d ", ch);
        }
        else if (ch == '\n' || ch == '\r') {
//            putc(ch, stdout);
            buf[i] = '\0';
            break;
        }
//        else if(i < BUF_SIZE - 1) {
//            buf[i++] = ch;
//            printf("%d ", ch);
//        }
//        Sleep(20);
        unsigned int t1 = get_time_millis();
        unsigned int dur = t1 - t0;
        printf("dur %u msec\n", dur);
        if(dur > timeout) {
            buf[i] = '\0';
            break;
        }
    }
#ifdef ON_X64
    system("/bin/stty cooked");
#endif
    return buf;
}

// 0, 1, 2, 3, -1 stands for up, right, down, left, no dir
int get_direction(char *buf)
{
    if(buf[1] == '[' && buf[0] == 27) {
        switch (buf[2]) {
            case 'A': return 0;
            case 'C': return 1;
            case 'B': return 2;
            case 'D': return 3;
            default: return -1;
        }
    }
    return -1;
}

// now use wsad to control
// -2 for exit
int read_direction()
{

    // state: 0, 1, 2
    int state = 0;
    int ret = -1, read_ret;
#ifdef ON_X64
    system("/bin/stty raw");
#endif
    while(1) {
        char ch;
#ifdef ON_X64
        if((read_ret = fread(&ch, sizeof(char), 1, stdin)) < 0)
#else
            if((ret = read(0, &ch, sizeof(char))) < 0)
#endif
        {
            ret = -2;
            break;
        }

        else if(read_ret == 0) {
            ret = -2;
            break;
        }
        else {
#ifdef USE_ARROW_KEY
            if(state == 0) {
                if(ch == 27)
                    state = 1;
            }
            else if(state == 1) {
                if(ch == '[')
                    state = 2;
                else if(ch == 27) {
                    ret = -2;
                    break;
                }
                else
                    state = 0;
            }
            else if(state == 2) {
                if(ch == 'A') {
                    ret = 0;
                    break;
                }
                else if(ch == 'C') {
                    ret = 1;
                    break;
                }
                else if(ch == 'B') {
                    ret = 2;
                    break;
                }
                else if(ch == 'D') {
                    ret = 3;
                    break;
                }
                else
                    state = 0;
            }
#else
            if(ch == 'w') {
                ret = 0;
                break;
            }
            else if(ch == 'd') {
                ret = 1;
                break;
            }
            else if(ch == 's') {
                ret = 2;
                break;
            }
            else if(ch == 'a') {
                ret = 3;
                break;
            }
            else if(ch == 27) {
                ret = -2;
                break;
            }
#endif

        }
    }

#ifdef ON_X64
    system("/bin/stty cooked");
#endif
    return ret;
}

// void test_input()
// {
//     while(1) {
//         int break_flag = 0;
//         int dir = read_direction();
//         switch (dir) {
//             case -2: break_flag = 1; break;
//             case 0: printf("up\r\n"); break;
//             case 1: printf("right\r\n"); break;
//             case 2: printf("down\r\n"); break;
//             case 3: printf("left\r\n"); break;
//             default: printf("no dir\r\n"); break;
//         }
//         if(break_flag)
//             break;
//     }
// }

int map_index(int x, int y, int w)
{
    return x * w + y;
}

void show_snake_node(int x, int y) {
#ifdef SHOW_VGA    
    vga_write_c_bf_color(x, y << 1, ' ', bgreen, lgreen);
    vga_write_c_bf_color(x, (y << 1) | 0x1, ' ', bgreen, lgreen);
#else
    put_c('*');
#endif
}

void show_wall_node(int x, int y) {
#ifdef SHOW_VGA
    vga_write_c_bf_color(x, y << 1, ' ', bgreen, lgreen);
    vga_write_c_bf_color(x, (y << 1) | 0x1, ' ', bgreen, lgreen);
#else
    put_c('*');
#endif   
}

void show_food(int x, int y) {
#ifdef SHOW_VGA
    vga_write_c_color(x, y << 1, 'x', lgreen);
#else
    put_c('x');
#endif
}

void blank_cover(int x, int y) {
#ifdef SHOW_VGA
    vga_write_c_color(x, y << 1, ' ', 0);
    vga_write_c_color(x, (y << 1) | 1, ' ', 0);
#else
    put_c(' ');
#endif
}

void show_map(unsigned char *map, int width, int height, int clear)
{
    int i,j;
    #ifndef SHOW_VGA
    if(clear == 1) {
        // int i;
        for(i = 0; i < height + 2; ++i) {
            printf("\033[1A"); //先回到上一行
            printf("\033[K");  //清除该行
        }
    }
    #else
    if(clear == 1) {
        for(i = 0; i < VGA_VSIZE; ++i)
            for(j = 0; j < VGA_HSIZE; ++j)
                vga_write(i, j, ' ');
    }
    #endif
    for(i = 0; i < height + 2; ++i) {
        for(j = 0; j < width + 2; ++j) {
            if(i == 0 || i == height + 1 || j == 0 || j == width + 1) {
                show_wall_node(i, j);
            }
            else {
                if(map[map_index(i - 1, j - 1, width)] == 1) {
                    show_food(i, j);
                }
                else if(map[map_index(i - 1,j - 1, width)] == 2) {
                    show_snake_node(i, j);
                }
                else if(map[map_index(i - 1, j - 1, width)] == 0)
                    blank_cover(i, j);
            }
        }
        #ifndef SHOW_VGA
        printf("\n");
        #endif
    }
}

#ifdef SHOW_VGA
void test_vga_color()
{
    int bg, fg;
    int i = 0, j = 0;
    int stop_flag = 0;
    for(bg = 0; bg < 0xff; bg += 1) {
        if(stop_flag)
            break;
        for(fg = 0; fg < 0xff; fg += 1) {
            vga_write_c_bf_color(i, j++, 'a', bg, fg);
            if(j >= VGA_HSIZE) {
                j = 0;
                i++;
            }
            if(i >= VGA_VSIZE) {
                // vga_scroll();
                stop_flag = 1;
                break;
            }
        }
        i++;
        j = 0;
        if(i >= VGA_VSIZE) {
            break;
        }
    }
}
#endif

void begin_game() {
    default_init_game();
    int width = get_width();
    int height = get_height();
#ifdef ON_X64
    printf("\033c");
#endif

    int count = 0;
    while(!is_game_over()) {
        unsigned char *map;
        get_map(&map);
        #ifndef SHOW_VGA
        int should_clear = 1;
        if(count++ == 0)
            should_clear = 0;
        #else
        int should_clear = 0;
        if(count++ == 0)
            should_clear = 1;
        #endif
        show_map(map, width, height, should_clear);
        int dir = read_direction();
        if(dir == -2)
            break;
//        int dir = -1;
        update_game(dir);

    }
    end_game();
}

