;--------------------------------------------------------------------------------
; Steps to subtract integers
; 1) Save integers into registers (whether user input or hard coded ints)
; 2) Copy first number into a register where result will be stored
; 3) Use subtract operator on that register
;       -   subtract num2 from number in result register
;       -   Now result = num1 - num2
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

        ;save your numbers into registers | * Subtract integers *
        mov     r12, [num]
        mov     r13, [num2]
        
        ;move 1st number into a result register so we can subtract from it | * Subtract integers *
        mov     r14, r12
        
        ;use sub operator | * Subtract integers *
        sub     r14, r13    ; r14 = r14 - r13

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
fmt     db  "%d - %d = %d", 10, 0
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
;   Enter a number: 8
;   Enter a number: 2
;   8 - 2 = 6
;--------------------------