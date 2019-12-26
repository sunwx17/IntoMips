#pragma once

#define VGA_BASE            0xba000000
#define VGA_COLOR_REG       0xba000e74

#define VGA_HSIZE           100
#define VGA_VSIZE           37

#define VGA_NAIVE


#define NUL                 0
#define SOH                 1
#define STX                 2
#define ETX                 3
#define EOT                 4
#define ENQ                 5
#define ACK                 6
#define BEL                 7
#define BS                  8
#define HT                  9
#define LF                  10
#define VT                  11
#define FF                  12
#define CR                  13
#define SO                  14
#define SI                  15
#define DLE                 16
#define DC1                 17
#define DC2                 18
#define DC3                 19
#define DC4                 20
#define NAK                 21
#define SYN                 22
#define ETB                 23
#define CAN                 24
#define EM                  25
#define SUB                 26
#define ESC                 27
#define FS                  28
#define GS                  29
#define RS                  30
#define US                  31
#define DEL                 127

#define SPACE               32

//32bit layout
//[..8bit../ bg(8bit) / fg(8bit) / ascii(8bit)]
#define VGA_COLOR_CHAR(cursor, bg, fg, ch)      ((((cursor) & 0x1) << 24) | (((bg) & 0xff) << 16) | (((fg) & 0xff) << 8) | ((ch) & 0xff))



void vga_putc(int c);
void vga_putc_controll(int c);
void vga_putc_visible(int c);

void vga_write(int v, int h, int c, int cursor_mode);
void vga_scroll();

void vga_set_cursor_mode();