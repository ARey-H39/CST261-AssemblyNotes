;--------------------------------------------------------------------------------
; Steps to add integers
; 1) Copy first number to rax  | must be saved to rax
; 2) Copy second number to any other register
; 3) For output purposes, make a copy of rax into another register (making a copy of num 1)
; 4) Clear out rdx to store remainder | remiander is stored in rdx automatically
; 5) Use division operator
;       -   divide number in rax by num2
;       -   now rax = num1 / nume
;       -   and rdx is the remainder of that
;
; See lines 50-65
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

        ;save your numbers into registers | * Divide integers *
        mov     rax, [num]      ; 1st number must be saved into rax
        mov     r12, [num2]     ; second can be stored anywhere

        mov     r13, rax        ; make copy of 1st number for output
        
        ;clear out rdx to store your remainder | * Divide integers *
        mov     rdx, 0  ; by default remainder is stored in rdx
        
        ;use div operator | * Divide integers *
        div     r12     ; rax = rax / r12
                        ;by default, division is done and stored in rax

        ;--------------------------------------------------


        ; ouput numbers and results
        mov     rdi, fmt
        mov     rsi, r13    ; num1
        mov     r8, rdx     ; remainder <-- we are using rdx, before it gets overwritten below
        mov     rdx, r12    ; num2
        mov     rcx, rax    ; result
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
fmt     db  "%d / %d = %d, R: %d", 10, 0
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
;   Enter a number: 10
;   Enter a number: 8
;   10 / 8 = 1, R: 2
;--------------------------