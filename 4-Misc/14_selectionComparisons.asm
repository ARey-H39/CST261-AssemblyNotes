;--------------------------------------------------------------------------------
; Steps to compare values and jump to labels
; 1) Move numbers to registers
; 2) Compare between the two numbers using "cmp"
; 3) Jump to specified labels based on certain conditions of "cmp"
;       -   je = jump if equal
;       -   jne = jump if not equal
; 4) Add labels to your program
;
;   * You can jump to specific parts of program without needing a condition using "jmp"
;   
;   * When comparing numbers, make sure your reserve at least 8 bits in section .bss
;
; See lines 52-65, 69-71, 75-76, 78, and 103-104
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
        mov     rsi, num1
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
        mov     rsi, num2
        xor     rax, rax
        call scanf


        ;--------------------------------------------------

        ; move numbers to registers
        mov     r12, [num1]
        mov     r13, [num2]

        ; compare the numbers
        cmp     r12, r13
        ; jump to specified label based on condition | label names can be anything
        je    same          ; jump if equal
        jne   different     ; jump if not equal
        jmp   end           ; jump no matter what

        ;--------------------------------------------------


; WIll jump here if compare is true
different:
        mov     rdi, formatNotEqual
        jmp     end

; will jump here if compare is false
same:
        mov     rdi, formatEqual
        jmp     end

end:
        ; by the time the program jumps here, rdi already has a value
        mov     rsi, r12
        mov     rdx, r13
        xor     rax, rax
        call printf

        ; end program
        mov     rax, SYS_EXIT
        xor     rdi, rdi
        syscall

        section     .data
prompt          db      "Enter a number: "
promptLength    equ     $-prompt

inputFormat         db      "%d", 0
formatNotEqual      db      "%d != %d", 10, 0
formatEqual         db      "%d == %d", 10, 0

SYS_EXIT    equ     60
SYS_WRITE   equ     1
STDOUT      equ     1

        section     .bss
num1    resb    8       ; reverved 8 bits to prevent garbage when comparing
num2    resb    8       ; reverved 8 bits to prevent garbage when comparing

;--------------------------
; Output example --
;   Enter a number: 10
;   Enter a number: 20
;   10 != 20
;--------------------------
