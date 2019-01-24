;calculating factorials

;n is in $1 and n! shall be in $3

;initialization
lis $3
.word 1
;use $11 as 1 literal
lis $11
.word 1

;loop till $1 = 0

loop:

beq $1, $0, end

mult $3, $1
mflo $3

sub $1, $1, $11
beq $0, $0, loop
end:
jr $31
