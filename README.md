# Learn assembly language on the Raspberry Pi in 2020 
## In short
This project contains gnu assembly source files target the raspberry pi 2.
Produced by learning assembly. 

## Description
From October 2019 to July 2020, I learned assembly on the Raspberry Pi 2. 

During this period, I followed the book 
"[RASPBERRY PI ASSEMBLER](https://personal.utdallas.edu/~pervin/RPiA/RPiA.pdf)", 
written by Roger Ferrer Ibáñez and William J. Pervin. 
This book is published under the 
[Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License.](https://creativecommons.org/licenses/by-nc-sa/4.0/)

During this time, I wrote several assembly files that were heavily derived from the book, 
but the project also contains code I created myself. For example, I wrote my own GPIO library 
in assembly, which uses the Linux kernel interrupt mmap to directly read and write 
the GPIO registers.

## Build instructions

### Prerequisites
- Raspbian environment on raspberry pi 2 hardware
- GCC (GNU Compiler Collection)
- glibc (GNU C Library)
- GNU Make
- binutils

### build and run
Enter the following command
```bash
make all
```

## Author
This project is created by:
- Initial author: **[Tiemen Molenaar](https://github.com/Tiemen-M)** 
