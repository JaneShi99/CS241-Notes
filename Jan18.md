## Procedures

Warm-up problem

```assembly
;Write an assembly language MIPS program that takes a value in
;register $1 and stores the sum of the digits in register $2.
```

- How do we write procedures/functions in MIPS?
- What if a procedure wants to use registers already has data?
  - reserve registers with a stack-like method
  - make sure the registers remain unchanged by the end of procedure.
  - However, we don't want out procedures to use the same RAM as the ones we use for registers 
  - Keep track of free RAM
    - keep memory from bottom up
- see lecture 4 slide #10 for an illustration of the function call stack
- calling procedures (functions) would push registers onto stack, and 
- retuning the procedure would pop them  off
- $30 is the stack pointer
- we can also use the stack for local storage, if we need it during procedure, then we just have to change back $30 later.

Template for a procedure that modifies \$1, and \$2

- Function f uses \$1 and \$2, so you have to store the original data in \$1, and \$2 away to free ram above $30 after you're done with function f, you can retrieve the original values .

```assembly
f:
    sw $1, -4($30)   ; Push registers we will modify
    			     ; program goes up from below to up
    			     ; So it starts at the addr above $30 and then goes up
    sw $2, -8($30)   ; push it to the spot that is one level higher
    	             ; work because you have the in the below code, 
    	             ; either $1 and $2 would both values backed up already
    lis $2           ; Decrement stack pointer
    .word 8          ; 8 since we have two words
    sub $30, $30, $2 ; subtract because the stack pointer goes up two words
    		 		 ; need to update the stack pointer, in case other 
    		   		 ; functions are called
    		   		 
    		   		 
    ;DO WORK
    
    ;must restore the stack pointer first, before the registers, else that '8' is gone
    lis $2
    .word 8
    add $30, $30, $2
    lw $2, -8($30)
    lw $1, -4($30)
    
    ; uh oh, how do we return?
    
```



- __Why is there a problem with returning?__

```assembly
main:
    lis $8
    .word f ; Recall f is an address
    jr $8 ; Jump to the line of f
    (NEXT LINE)
    		;problem: when f is done, we want to go to next line. 
```



- __Use command jalr__
  - jalr $s: 0000 00ss sss0 0000 0000 0000 0000 1001
  - Jump and Link Register.
  - it sets \$31 to be the PC and sets PC to \$s
  - example: temp = \$s then \$31 = PC then PC = temp
- Lost the loader address! So store it in stack then grab it abck later

```assembly
main: 
	lis $8
	.word f
	sw $31, -4($30)
	lis $31
	.word 4
	sub $30, $30, $31
	jalr $8 
	lis $31
	.word 4
	add $30 $30 $31
	lw $31, -4($30)
	jr $31
```

```assembly
f:
	;.....
	jr $31 ; added a new line
```



### How to we pass parameters?

- We well just use registers
- but if there are too many, we can use the stack. Documentation is important here!

###Example: Sum Even 1 to N 

```assembly
;sumEvens1ToN adds all even numbers form 1 to N 
;Registers:
; $1 Scratch Register; Should save!
; $2 Scratch Register; Should save!
; $3 Output Register; Do not save!
	sw $1, -4($30)
	sw $2, -8($30)
	lis $1
	.word 8
	add $3, $0, $0
; Do work from tuesday
; Bunch of MIPS code
```

### Now, how do we print?

- you have a special address!
  - 