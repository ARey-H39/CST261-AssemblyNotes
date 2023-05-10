;--------------------------------------------------------------------------------
; Steps to take user input and display input
; 1) Import scanf
; 2) Define input format in rsi
; 3) Define the variable where input will be saved
;       -   Since this variable is not constant, it has to be defined in .bss
;           instead of .data
; 4) Set rax to 0 (* another way to do this is mov rax, 0)
; 5) run scanf method
; 6) Define the variable where input will be saved and the amount of bytes reserved
;
; 7) Store input from variable into any unused register
; 8) Display that data using printf (lines 41-44)
;
; See lines 32-35, 38, 41-44, 54, 56, and 63
;--------------------------------------------------------------------------------
extern printf   ; import printf method
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

        ; Good idea to store variable's your going to output into registers, usually a register further down the order of registers
        mov     r12, [age]         ; saved variable into r12 register

        ; Display the input into a message using the printf method | see printNum.asm
        mov     rdi, messagefmt
        mov     rsi, r12            ; use the data that we stored in r12
        xor     rax, rax
        call printf

        mov     rax, SYS_EXIT
        xor     rdi, rdi
        syscall

        section     .data
prompt          db      "Enter your name: "
promptLength    equ     $-prompt

messagefmt      db      "Nice, You're already %d!", 10, 0

inputFormat     db      "%d"        ; defined the input format; %s for string, %d for integers, %f for floats

SYS_EXIT        equ     60
SYS_WRITE       equ     1
STDOUT          equ     1

        section     .bss    ; section for non constant variables, variables that can change througout the program
age    resb     4         ; resb = reserve byts | reserve how many you think is appropriate


;--------------------------
; Output--
;   Enter your age: [age]
;   Nice, you're already [age]!
;--------------------------