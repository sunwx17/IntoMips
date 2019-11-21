ucore-thumips [![Build Status](https://travis-ci.org/z4yx/ucore-thumips.svg?branch=ucore-fix)](https://travis-ci.org/z4yx/ucore-thumips)
=============

Build
-----
Make sure that `mips-mti-elf-*` is in your `PATH`

For linux, you can use [MTI Bare Metal](https://cloud.tsinghua.edu.cn/f/16dde018b00749a4a4de/) compiler.

Build for FPGA:

`make ON_FPGA=y -j4`

Simulation
----

`make ON_FPGA=n qemu`

串口通信运行

```
qemu-system-mipsel -M mipssim -m 32M -serial stdio -kernel obj/ucore-kernel-initrd
```

More
---

See `doc` folder.

