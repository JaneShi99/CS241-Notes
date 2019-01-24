### Expect to use linux!

- Refer to the MIPS Architecture model and the MIPS reference sheet

- overview:

  - C/C++, high level language ———(compiler)———> assembly language
  - assembly language, low level instructions ———(assembler)———> machine language, 1 or 0 version
  - machine language, 1 or 0 version, CPU understads this. ———(loader)———>memory/CPU

- How do we know whether memory contains machine instructions or data? We really dont. As they are both 1 and 0s.

- Machine sequence map to specific instructions

- many different CPUs & many different machine languages

- MIPS(simplified)

  - we are given 18 instructions for MIPS
  - CPU-central processing unit (brains of our machine)
  - Control unit: 
    - decodes instructions
    - dispatches to other parts of computer to carry out instructions
  - ALU (Arithmetic/ logic unit)
    - it does math
  - Memory: it has many types
    - EXPENSIVE and FAST
    - CPU cache, RAM
    - refister L1,L2,L3, main memory
    - CHEAP and SLOW
    - disk
      - HD, SSD, Network
    - On the CPU, small amount of very fast memory called registers, we have 32 registers
    - MIPS has 32 general purpose registers, each is of size 32 bits, or 4 bytes
    - there are 128 bytes. 32 * 4 bytes = 128 bytes, like 128B. B stands for byte, b stands for bit.
  - GB is bigger than Gb. So in marketing people use Gb not GB for bigger number

- CPU an only operate on data that is stored in the registeres. called \$0, \$1,....\$3

  - \$0 is always0
  - \$31 is alo special
  - \$29,\$30 is kind of sort of special.

- Add op: 15 bites to represent the 3 registers it uses, 32bits-15=>17 bits to encode the operatins "op code" determine which operation we are executing.

- RAM- large amount of memory away from CPU.

  - data travelrs between RAM and CPU ont he bus
  - big array of n bytes, n large
  - each cell has an address 0,1,2,...n-1
  - each 4-byte block 4k,...4k+3, is bound
  - words have addresses, 0, 4, 8,....
  - RAM process is much slower  than register

- 5 bits to represent a register.. 

  - 31-26: op (6 bits)
  - 25-21: rs (5 bits)
  - 20-16: rt (5 bits)
  - 15-11: rd (5 bits)
  - 10-6: shamt (5 bits)
  - 5-0: funct (6 bits)

- data in RAM must be transferred to CPU before it can be communicating with RAM 2 operations

- load: 

  - transfer a word from a memory address in ram to a register
  - Desired address goes into memoery address register (MAR). Data at that location is returned on the bus , and goes into the memory data register (MDR). Then value of MDR is moved to the desination register. 

- store:

  - it does the reverse

- How does code get executed?

  - We have two other special registers. 

    -  PC (program counter): holds the address of the next instruction to execute.

    - By convention, we guarantee that a specific address (say 0) contains code. => initialize PC to 0

    - computer then runs the Fetch-Execute cycle. 

    - ```MIPS
      PC <- 0
      loop
      	IP <- MEM[PC]
      	PC <- PC+4
      	decode and execute instruction into IR
      end loop
      ```

    - ### Note that PC hold the address the address of the next instrution when the recent instruction is just executed

    - ### Progrm called the loader puts the program into RAM, and then set its PC to address of 1st instruction

- Program called the loader puts the program into RAM, and then set its PC to address of 1st instruction
- What happens when a progam ends?
  - A loader loaded your program into memory, set PC...
  - When your program is completed, it returns control to loader. Set PC to the address of the next instruction in the loader
  - what memory address is this?
    - __\$31__
  - it jumps from your loader ot your program, then jump back to the loader
  - So register \$31 is special, and it will contain the memory address you want to jump back to! Need to set PC to the content of register $31. jr \$31. (jump to content stored at memory \$31)
- hi:lo is used for multiplication

