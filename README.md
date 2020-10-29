# learnAsm
everything i learn about assembly language 


## downloading nasm 
```bash
sudo apt-get install as31 nasm
```
as31 = intel 8031 / 8051 assembler

## running nasm 
```bash
nasm -f file.asm
ld -s -o outputName file.o
./outputName
```
```bash
nasm -f file.asm
ld -m elf_i386 file.o -o outputFile
./outputFile
```
## compile asm using gcc
for the first make sure ```asm _start``` label is main \
create object of .asm file with ```bash nasm -f outputName file.asm``` \
link objected file created with ```bash gcc -m32 -o outputName file.o``` \
run ./outputName
