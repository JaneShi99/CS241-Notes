;arrays in mips, compute the product
;addr of array is $1 and length is in $2
;want to compute the product store in $3

;$2 = 4 * $2 + $1
add $2, $2, $2
add $2, $2, $2
add $2, $2, $1

lis $4
.word 4

lis $3
.word 1

;now, loop until $1 = $2. i.e. when the array reaches the the ONE SPOT after arr 2 ends

loop:
beq $1, $2, end

;$5 =*$1 = A[i]
lw $5, 0($1)

mult $3, $5
mflo $3

add $1, $1, $4
beq $0, $0, loop

end:
jr $31
