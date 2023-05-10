;--------------------------------------------------------------------------------
; Steps to convert integer to float
; 1) Copy integer into a seperate "r" register
; 2) Copy float into a seperate "xmm" register
; 3) Use cvtsi2sd to convert integer to float and store in an "xmm" register 
; 4) Now you can use both numbers as floats
;
;   Note: seems like steps 1 and 2 have to be done immediately after taking
;           their respective inputs.
;
; See lines 34, 50-63, 83-85, and 92-93
;--------------------------------------------------------------------------------

extern printf
extern scanf

        global      _start

        section     .text
_start:
        ; Ask for input A (integer)
        mov     rax, SYS_WRITE
        mov     rdi, STDOUT
        mov     rsi, prompt
        mov     rdx, promptLength
        syscall

        ; Take input A (integer)
        mov     rdi, inputFormatInteger
        mov     rsi, integer
        xor     rax, rax
        call scanf
        
        mov     r13, [integer] ; Copy integer to an appropriate register

        ; Ask for input B (float)
        mov     rax, SYS_WRITE
        mov     rdi, STDOUT
        mov     rsi, prompt
        mov     rdx, promptLength
        syscall

        ; Take input B (float)
        mov     rdi, inputFormatFloat
        mov     rsi, floatNum
        xor     rax, rax
        call scanf


        ;--------------------------------------------------

        ; Copy float to an appropriate register
        movsd   xmm0, [floatNum]

        ; Convert integer in r13 into a float, and store in xmm2
        cvtsi2sd    xmm2, r13

        ; Now you can do math operations on these numbers, ex. addsd
        ; pxor    xmm1, xmm1
        addsd   xmm1, xmm2
        addsd   xmm1, xmm0

        ;--------------------------------------------------


        ; show results
        mov     rdi, outputFormat
        mov     rsi, [integer]
        ; movq    xmm0,[floatNum]
        ; movq    xmm1, xmm1
        mov     rax, 1
        call    printf

        ; exit program
        mov     rax, SYS_EXIT
        xor     rdi, rdi
        syscall

        section     .data
prompt          db      "Enter a number: "
promptLength    equ     $-prompt

inputFormatInteger      db      "%d", 0   ; %d is used to take finteger inputs
inputFormatFloat        db      "%lf", 0  ; %lf is used to take floating point inputs
outputFormat            db      "%d + %f = %f", 10, 0

SYS_EXIT    equ     60
SYS_WRITE   equ     1
STDOUT      equ     1

        section     .bss
integer     resb    4       ; notice this is resb
floatNum    resq    1       ; and this is resq

;--------------------------
; Output example --
;   Enter a number: 10
;   Enter a number: 3.2
;   20.20000 + 3.50000 = 13.20000
;--------------------------