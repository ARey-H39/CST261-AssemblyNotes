;--------------------------------------------------------------------------------
; Steps to print out floating numbers
; 1) Import printf
; 2) See lines 32-40, 50, and 58
;       -   the amount of registers you have to save numbers to
;            depends on the amount of %f that appear in your
;            string format template in section .data
;       - Its possible to display both floats and integers, just make sure
;       - you use the right registers
; 2) Reserve all your variables in section .bss
;--------------------------------------------------------------------------------

extern printf
extern scanf

        global      _start

        section     .text
_start:
        ; Ask for input
        mov     rax, SYS_WRITE
        mov     rdi, STDOUT
        mov     rsi, prompt
        mov     rdx, promptLength
        syscall

        ; Take input
        mov     rdi, inputFormat
        mov     rsi, floatNum
        xor     rax, rax
        call scanf

        ; Output text with floating number | * Display floats *
        mov     rdi, outputFormat
        movq    xmm0, [floatNum]        ; floats use different register xmm0 ... xmm15
        mov     rax, 1                  ; set rax to 1 when outputing floats
        call printf
        ; When moving floating points into an xmm register,
        ; you have to use a different operation, either
        ; movq or movsd (more on movsd later)

        mov     rax, SYS_EXIT
        xor     rdi, rdi
        syscall

        section     .data
prompt          db      "Enter a number: "
promptLength    equ     $-prompt

inputFormat     db      "%lf"   ; %lf is used to take floating point inputs
outputFormat    db      "You entered %f", 10, 0

SYS_EXIT        equ     60
SYS_WRITE       equ     1
STDOUT          equ     1

        section     .bss
floatNum     resq    1     ; Reserve space for floating number using resq instead of resb

;--------------------------
; Output example --
;   Enter a number: 10.5
;   You entered 10.500000
;--------------------------