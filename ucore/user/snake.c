#include <stdio.h>
#include "snake_util.h"
#include "gameshow.h"

//void test()
//{
//    int i = 0;
//    while(1){
//        printf("\033c");
//        printf("%d\n%d\n", i, i+1);
//
////        printf("\033[1A"); //先回到上一行
////        printf("\033[K");  //清除该行
////        printf("\033[1A"); //先回到上一行
////        printf("\033[K");  //清除该行
//        i+=2;
////        std::this_thread::sleep_for(_2s);
//        Sleep(2000);
//        if(i > 10000)
//            break;
//    }
//}

//void test_show()
//{
//    char *line = NULL;
//    while((line = read_line(100000))) {
//        printf("\r\n");
//        printf("a new line read\n");
//        if(line[0] == '\033' && line[1] == 'c') {
//            break;
//        }
//    }
//}

int main() {
//    test_input();
    begin_game();
//    printf("%d\n", (-2 % 3));
    // test_vga_color();
    return 0;

}