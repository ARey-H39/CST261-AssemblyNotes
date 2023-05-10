;--------------------------------------------------------------------------------
; Steps to add integers
; 1) Save integers into registers (whether user input or hard coded ints)
; 2) Clear out a register where the sum will be stored (Set it to 0)
; 3) Use add operators on that register
;       -   add num1 into sum
;       -   add num2 into sum
;       -   now sum is num1 + num2
;
; See lines 48-61
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

        ;save your numbers into registers | * Add integers *
        mov     r12, [num]
        mov     r13, [num2]
        
        ;clear out register where sum will be saved in | * Add integers *
        mov     r14, 0
        
        ;use add operators | * Add integers *
        add     r14, r13    ; r14 = r14 + r13
        add     r14, r12    ; r14 = r14 + r12

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
fmt     db  "%d + %d = %d", 10, 0
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
;   Enter a number: 5
;   Enter a number: 4
;   5 + 4 = 9
;--------------------------