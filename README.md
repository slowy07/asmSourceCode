# learnAsm
Everything i learn about assembly language


## downloading nasm 
In all currently supported operating systems, you can download nasm from the [official website](http://www.nasm.us/).
```bash
sudo apt-get install asm31 nasm
```
**as31** = intel 8031 / 8051 assembler\
**nasm** = general purpose assembler

## compiling
**elf32**
```bash
nasm -f elf32 -o asm.o asm.asm
ld -m elf_i386 -o asm asm.o
```
**elf64**
```bash
nasm -f elf64 filename.asm
ld -s -o filename filename.o
./filename
```
