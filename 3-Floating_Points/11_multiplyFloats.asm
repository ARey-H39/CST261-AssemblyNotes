;--------------------------------------------------------------------------------
; Steps to multiply floats
; 1) Save floats into registers (whether user input or hard coded floats)
; 2) Use multiply operator
;       -   mulsd float2 from float1
;       -   now resutt = float1 * float2
;
; See lines 45-54, 81-82
;--------------------------------------------------------------------------------

extern printf
extern scanf

        global      _start

        section     .text
_start:
        ; Ask for input A
        mov     rax, SYS_WRITE
        mov     rdi, STDOUT
        mov     rsi, prompt
        mov     rdx, promptLength
        syscall

        ; Take input A
        mov     rdi, inputFormat
        mov     rsi, floatNum1
        xor     rax, rax
        call scanf

        ; Ask for input B
        mov     rax, SYS_WRITE
        mov     rdi, STDOUT
        mov     rsi, prompt
        mov     rdx, promptLength
        syscall

        ; Take input B
        mov     rdi, inputFormat
        mov     rsi, floatNum2
        xor     rax, rax
        call scanf


        ;--------------------------------------------------
        
        ; Save you numbers into registers
        movsd   xmm2, [floatNum1]   ; movesd is used when working with floats
        movsd   xmm1, [floatNum2]

        ; use add operators
        mulsd   xmm2, xmm1      ; xmm2 = xmm2 * xmm1

        ;--------------------------------------------------


        ; Output your results
        mov     rdi, outputFormat
        movq    xmm0, [floatNum1]
        movq    xmm1, [floatNum2]
        movq    xmm2, xmm2
        mov     rax, 1
        call printf

        mov     rax, SYS_EXIT
        xor     rdi, rdi
        syscall

        section     .data
prompt          db      "Enter a number: "
promptLength    equ     $-prompt

inputFormat     db      "%lf", 0   ; %lf is used to take floating point inputs
outputFormat    db      "%f * %f = %f", 10, 0

SYS_EXIT        equ     60
SYS_WRITE       equ     1
STDOUT          equ     1

        section     .bss
floatNum1   resq    1
floatNum2   resq    1

;--------------------------
; Output example --
;   Enter a number: 20.2
;   Enter a number: 3.5
;   20.20000 * 3.50000 = 70.00000
;--------------------------