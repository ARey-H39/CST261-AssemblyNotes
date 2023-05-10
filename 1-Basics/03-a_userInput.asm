;--------------------------------------------------------------------------------
; Steps to take user input
; 1) Import scanf
; 2) Define input format in rsi
; 3) Define the variable where input will be saved
;       -   Since this variable is not constant, it has to be defined in .bss
;           instead of .data
; 4) Set rax to 0 (* another way to do this is mov rax, 0)
; 5) run scanf method
; 6) Define the variable where input will be saved and the amount of bytes reserved
;
; See lines 29-32 and 49
;--------------------------------------------------------------------------------

extern scanf    ; import scanf method

        global      _start

        section     .text

_start:
        mov     rax, SYS_WRITE
        mov     rdi, STDOUT
        mov     rsi, prompt
        mov     rdx, promptLength
        syscall

        ; Take input | *taking user input*
        mov     rdi, inputFormat    ; define the format of the input %s for string, %d for integers, %f for floats
        mov     rsi, age            ; define the variable where input will be saved
        xor     rax, rax            ; mov rax, 0
        call scanf                  ; run scanf

        mov     rax, SYS_EXIT
        xor     rdi, rdi
        syscall

        section     .data
prompt          db      "Enter your age: "
promptLength    equ     $-prompt

inputFormat     db      "%s"        ; defined the input format

SYS_EXIT        equ     60
SYS_WRITE       equ     1
STDOUT          equ     1

        section     .bss    ; section for non constant variables, variables that can change througout the program
age     resb     80        ; resb = reserve byts | reserve how many you think is appropriate


;--------------------------
; Output--
;   Enter your age: [age]
;--------------------------