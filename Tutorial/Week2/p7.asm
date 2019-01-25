;functions and recursion in MIPS

;writing the factorial function via recursion

fact:
sw $31, -4($30)
sw $1,  -8($30)
sw $11,-12($30)
lis $31
.word 12
sub $30, $30, $31

lis $11
.word 1

;if $1 = 0, base case $3 = 1
;check the recursion condition
;11 is used for storing the product
bne $1, $0, recur 
add $3, $11, $0
beq $0, $0, clean

;recursion step
recur: 
sub $1, $1, $11
lis $31
.word fact
jalr $31

;restore values of $1
add $1, $1, $11

mult $3, $1
mflo $3


//
A good general template for recursion


FUNCTION:
sw $31, -4($30)
sw
......
sw

lis $31
.word 4*n
sub $30, $30, $31
work on setup
work on base case 
work on recur case


RECUR:
just work on basic stuff
lis 31 to be FUNCTION
jalr to the function

now restore the value returned by function

CLEAN:
basically add back stack ptr by 4*n
sw back the n-tuple stack including $31
then jr $31





