;--------------------------------------------------------------------------------
; Steps to multiply integers (with imul operator)
; 1) Save integers into registers (whether user input or hard coded ints)
; 2) Copy num1 into a register where result will be stored
; 3) Use multiply operator on that register:
;       -   multiply num2 by the number stored in result register
;       -   result = num1 * num2
;
; See lines 47-59
;--------------------------------------------------------------------------------

extern printf
extern scanf

        global      _start

        section     .text

_start:
        ;prompt for input A
        mov     rax, SYS_WRITE
        mov     rdi, STDOUT
        mov     rsi, message1
        mov     rdx, mess1len
        syscall

        ;get input A
        mov     rdi, fmtin
        mov     rsi, num
        xor     rax, rax
        call scanf

        ;prompt for input B
        mov     rax, SYS_WRITE
        mov     rdi, STDOUT
        mov     rsi, message1
        mov     rdx, mess1len
        syscall

        ;get input B
        mov     rdi, fmtin
        mov     rsi, num2
        xor     rax, rax
        call scanf


        ;--------------------------------------------------

        ;save your numbers into registers | * Multiply integers *
        mov     r12, [num]
        mov     r13, [num2]
        
        ;move 1st number into a result register so we can multiply from it | * Multiply integers *
        mov     r14, r12
        
        ;use imul operator | * Multiply integers *
        imul     r14, r13    ; r14 = r14 * r13

        ;--------------------------------------------------


        ; ouput numbers and results
        mov     rdi, fmt
        mov     rsi, r12    ; num1
        mov     rdx, r13    ; num2
        mov     rcx, r14    ; result
        xor     rax, rax
        call printf

        ;end program
        mov     rax, SYS_EXIT
        xor     rdi, rdi
        syscall

        section     .data
;strings and lengths
message1    db      "Enter a number: "
mess1len    equ     $-message1

;formats:
fmt     db  "%d X %d = %d", 10, 0
fmtin   db  "%d", 0

;identifiers for system calls
SYS_EXIT    equ     60
SYS_WRITE   equ     1
STDOUT      equ     1

        section     .bss
num     resb    4
num2    resb    4

;--------------------------
; Output example --
;   Enter a number: 2
;   Enter a number: 5
;   2 X 5 = 10
;--------------------------