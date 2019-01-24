;using stacks in mips

;task: read in from stdin until EOF is encountered, then print the 
;same characters out backwards. This kind of requires recursion

;$3 stores the current char read
;$27 is stdin, $28 is stdout
;$24 stores eof
;$4 stores literal 
;$26 stores the initial value of $30, which is the current stack pointer somewhere
;       in memory

;what is your general strategy?
;first, remember to track where your stack ptr originally is!
;inside loop, you read from stdin, whenever continures, push to stack, update stackptr
;and then keep looping

;else when you get eof, dont continue and done
;done goes to another loop that reads backwards
;whenever stack pointer is the same as original, meanning you're done popping stack
;if not you just keep on added back stack ptr and print

;stack invaiant: stack pointer is ALWAYS preserved so that
;0($30)holds the latest element
;-4($30)to -1($30) holds the current empty slot

lis $27
.word 0xffff0004

lis $28
.word 0xffff000

lis $4
.word 4

lis $24
.word -1

add $26, $30, $0

;loading the stack
loop1:
lw $3, 0($27)
beq $3, $24, endLoop1
;try to follow te procedure where always store stack item to -4($30) then decrement ptr
sw $3, -4($30)
sub $30, $30, $4
beq $0, $0, loop1

;by convention, you always do -4($30)!!!!!
endLoop1:
loop2: 
beq $26, $30, finish
add $30, $30, $4
lw $3, -4($30)
sw $3, 0(28)
beq $0,$0, loop2


finish:
jr $31


;trick
;always use -4($30)
;when pushing, do store $item, -4($30), and $30 = $30 - 4
;when popping, do $30 = $30 + 4, and load $item, -4($30)




