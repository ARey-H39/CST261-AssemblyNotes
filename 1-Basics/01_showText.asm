;--------------------------------------------------------------------------------
; Steps to print out text
; 1) copy lines 15-19
; 2) Change showMessage and messageLength to varialbes you will define later
; 3) Define those variables in section .data (like in lines 33 and 34
;--------------------------------------------------------------------------------

        global      _start      ; identify where the program starts | *standard in all programs

        section     .text       ; section where your program's code is written | *standard in all programs

_start:
        ; output text, make sure you define variables in section.data | * display text *
        
        mov     rax, SYS_WRITE          ; Define the system call used to output text
        mov     rdi, STDOUT             ; Parameter 1: Define the output format of SYS_WRITE (standard output)
        mov     rsi, showMessage        ; Parameter 2: Define the char string that will be outputed
        mov     rdx, messageLength      ; Parameter 3: Define the length of the char string
        syscall                         ; Call the identified system call


        ; Close the program | *standard in all programs
        mov     rax, SYS_EXIT           ; Define the system call used to exit the program
        xor     rdi, rdi                ; Parameter 1: Define the integer exit code (0 means program ran successfully)
        syscall                         ; Call the identified system call



        section     .data       ; This section is where all constant variables are defined | *standard in all programs

; define strings and lengths | * display text *
showMessage     db      "Hello world", 10		; 10 means new line after text
messageLength   equ     $-showMessage		; "$-" <--counts length of string automatically

; identifiers for system calls | *standard in all programs
SYS_EXIT        equ     60
SYS_WRITE       equ     1
STDOUT          equ     1


;--------------------------
; Output [in terminal]
; Hello world
;--------------------------