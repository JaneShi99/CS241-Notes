### Jan 15th

#### Examples with MIPS

- Write a MIPS program that adds together 11 and 13.

- ```assembly
  lis $8
  .word 11
  lis $9
  .word 0xd
  add $3, $8, $9
  jr $31
  ```

- __Always return__

- ```assembly
  jr $31
  ```

- __More operations__

- issue with multiplying and division: overflow

- ```assembly
  mult $s, $t  ;most sig word in hi, least in lo
  div $s, $t ;places quotient in lo, remainder in hi
  mfhi $d ;move hi to d
  mflo $d ;move from lo to d
  ```

- __RAM__

  - every memory in RAM has addr 1 to n-1
  - words occur every 4 bytes starting with byte 0
    - 0 4 8 ... n-4
  - words are formed from consecutive bytes
  - we cannot use the data on the RAM
    - must transfer first to registers

Operation on RAM

```assembly
lw $t i($s) ;$t = M[$s+i]
sw $t i($s) ;M[$s+i] = $t
```

### Example 

Suppose that \$1 contains the address of an array and \$2 takes the
number of elements in this array (assume less than 220). Place the
number 7 in the last possible spot in the array.

```assembly
lis $8
.word 0x7
lis $9
.word 0x4
mult $2, $9
mflo $3
add $3, $3, $1
sw $8, -4($3)
jr $31
```

### Branching

- you can Branch on equal and not equal

- Think about the fetch execute cycle

- ```assembly
  beq $s, $t, i ;Branch on equal. if $s==$t then pc += i * 4
  bne $s, $t, i ;Branch on no-equal. if $s!=$t then pc += i * 4
  ```

- Example: beq \$5 \$6 1, will skip to the instructruction after following one

 ### Example

- Write an assembly language MIPS program that places the value 1
  in register \$2 if the number in register \$1 is even and places the
  value 0 in register \$2 if the number is odd.

```assembly
lis $8 ; store 2 in reg 8
.word 2
lis $9 ; store 1 in reg 9
.word 1
div $1, $8 ; divide it by 2
mfhi $2 ; reminder stored in $2
sub $2, $2, $9 ; subtract reminder by 1: even-> -1 odd ->0
beq $2, $0, 1 ;is it's odd then store 0 at $2 then return
add $2, $9, $0 ; if it's even then you store 1 at $2
jr $31
```



### Other commands

```assembly
slt $d, $s, $t; Sets the $d to be 1 if $s is less than register $t and 0 otherwise
```



### Example

Write an assembly language MIPS program that negates the value
in register $1 provided it is positive.

```assembly
slt $2, $0, $1 ; $2=1 if o<$1 and 0 otherwise
beq $2 $0 1
sub $1 $0 $1
jr $31
```



__Looping__

add all even nubers from 1 to 20 inclusive store it in $3

```assembly
lis $8
.word 20
lis $9
.word 2
add $3, $0, $0
add $3, $3, $8
sub $8, $8, $9
bne $8, $0, -3
jr $31
```

#### Lables

```assembly
sub $3, $0, $0
sample:
add $1, $0, $0
;samples work like go to statements
```

