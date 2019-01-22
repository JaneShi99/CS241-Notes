### The assembler

- Our goal is to convert assembly code (MIPS) into machine code (0 and 1s)
- Input: assembly code
- Output: amchine code

- Two phases: Analysis and synthesis
  - Analysis: understand input code (group tokens) 
    - The tokens can be labels, numbers, .word, or mips instruction
  - Synthesis: output the equivalent code, in the targetnew format (output the machine code)

### Finding labels

- we want to first know what labels are, as they are not garbage.

- you do two passes

  - pass 1: group tokens into instructions and record address of all labelled instructions
    - put it into a symbol table
    - you can have a label at the end, or have multiple labels on one line
  - pass 2: tranlate each instructions into machine code, and if it refer to a label, we associate that address with the label in the symbol table

- Your assembler:

  - Task #1: it will output machine code from assembled MIPS to std
  - Task #2: output symbol table to stderr

- ### 

### Partitioning output

- 0001 0100 0100 0000 1111 1111 1111 1101
- want to print these 8 bytes
- \[6 bits opcode] \[5 bits reg 1\]\[5 bits reg2\]\[16 bits offset\]
- Time to bitshift
- k<<digs where digs represent number of digits for the shifting. i.e. k * 2^digs
- bitwise or joins the strings, like concatenation

```c++
int instr = (5 << 26) | (2 << 21) | (0 << 16) | offset
```

what if offset is more than 16 bits long?

- Example: offset = 1111 1111 1111 1111 1111 1111 1111 1101 (you only want the last 16 bits)
- bitmasking: __bitwise and__ with 0000 0000 0000 0000 1111 1111 1111 1111
- offset = -3 & 0xffff first!!!

### Printing 

```c++
cout<<instr //it's bad because it prints out 9 bytes corresponding to ASCII
    		//why not strings? because it's too complicated for parsing and other complicated
			//mechanics. Another reason is for simplification/ generalization as
    		//you don't want any library/ language specific extra conditions
int instr = (5 << 26) | (2 << 21) | (0 << 16) | (-3 & 0xffff);
unsigned char c = instr >>24;
cout<<c;
c = instr >>16;
cout<<c;
c = instr >>8;
cout<<c;
c = instr cout<<c;

```



——————————————————————————END OF MIPS —————— ——— ———  ——— ——— 

### Formal language

- Definition
  - An alphabet is a non-empty finite set of symbols often denoted by Σ.
  - An string (or word) w is a finite sequence of symbols chosen from Σ. The set of all strings over an alphabet Σ is denoted by Σ∗
  - A language is a set of strings.
  - The length of a string w is denoted by |w|
- $\epsilon​$ is the empty string, it belongs to all alphabets

### Objective

- Given a language determine whether string belongs to the language
- 