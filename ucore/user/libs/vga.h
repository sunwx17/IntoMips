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
#define VGA_COLOR_CHAR(bg, fg, ch)      ((((bg) & 0xff) << 16) | (((fg) & 0xff) << 8) | ((ch) & 0xff))

// color use pre 24bit and char use later 8 bit
// [color(24bit), ascii(8bit)]
// #define COLOR_AND_CHAR(color, ch) (((color) & 0xffffff00) | ((ch) & 0xff))

// #define VGA_GET_RGB(r, g, b) ()
void vga_putc(int c);
void vga_putc_controll(int c);
void vga_putc_visible(int c);

// fg is foreground color, background color is black in this function
// 0x0	Black	    0x8	Dark Gray
// 0x1	Blue	    0x9	Light Blue
// 0x2	Green	    0xa	Light Green
// 0x3	Cyan	    0xb	Light Cyan
// 0x4	Red	        0xc	Light Red
// 0x5	Magenta	    0xd	Pink
// 0x6	Brown	    0xe	Yellow
// 0x7	Light Gray	0xf	White
void vga_write_c_color(int v, int h, int ch, int fg);
void vga_write_c_bf_color(int v, int h, int ch, int bg, int fg);

void vga_write(int v, int h, int c);
void vga_scroll();