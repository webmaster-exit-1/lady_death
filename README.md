<!-- markdownlint-disable -->
# Lady Death: Steel Armadillo

## Description

Lady Death is a 32-bit Assembly program designed to interact directly with the operating system. <br>
Originally discovered in either the depths of VX Underground or the vast Phrack archives, this code is a relic from the past. <br>
<u>Use at your own risk!</u>

### Features

* Direct OS interaction through syscalls
* Low-level programming for maximum control
* Designed for 32-bit systems (Windows 98 compatible)

### Requirements

* NASM (Netwide Assembler) for Linux
* MASM (Microsoft Macro Assembler) for Windows
* LD (GNU Linker) for Linux

### Compilation

#### For Linux

* Install NASM

  ```bash
  sudo apt-get install nasm
  ```

* Compile

  ```nasm
  nasm -f elf32 steel_armadillo.asm
  ```

* Link

  ```c
  ld -m elf_i386 -s -o lady_death steel_armadillo.o
  ```

* Run

  ```bash
  ./lady_death
  ```

#### For Windows

* Install MASM

* Open the project in an IDE like Visual Studio

* Build the project to compile and link

* Run the executable

#### Disclaimer

<b><u>This code is provided "as is" without any warranties.</u></b> <br> 
<b><u>It was found in underground archives and its original purpose is not fully known.</u></b> <br> 
<b><u>Exercise extreme caution when compiling and running this program.</u></b> <br>
<b><u>Niether the author of this repository (WebMaster-Exit-1) or the publisher (Github) Will be held liable for any and all lose of data; damaged and or destroyed software and or hardware.</u></b> <br>
<b><u>Or the lose of freedom do to the end users use or missuse of the code found herein.</u></b> <br>
<b><u>All credit goes to the original author. I (webmaster-exit-1) am just sharing it


