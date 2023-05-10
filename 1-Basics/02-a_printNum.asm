;--------------------------------------------------------------------------------
; Steps to print out numbers in text
; 1) Import printf
; 2) copy lines 18-21
; 3) Change fmt and [num] to your needs
; 4) Define those variables in section .data (like in lines 34 and 37)
;--------------------------------------------------------------------------------

extern printf   ; import printf method | * Display text with number *

        global      _start      ; identify where the program starts | *standard in all programs

        section     .text       ; section where your program's code is written | *standard in all programs

_start:
        ; output text with number, make sure you define variables in section.data | * Display text with number *
        
        mov     rdi, fmt                ; Define the string format template
        mov     rsi, [num]              ; Define the 1st number that will be inserted into string format template (var has to be in [])
        xor     rax, rax                ; Set rax register to 0
        call printf                     ; call printf method


        ; Close the program | *standard in all programs
        mov     rax, SYS_EXIT           ; Define the system call used to exit the program
        xor     rdi, rdi                ; Parameter 1: Define the integer exit code (0 means program ran successfully)
        syscall                         ; Call the identified system call



        section     .data       ; This section is where all constant variables are defined | *standard in all programs

; formats | * Display text with number *
fmt     db      "Your number is: %d", 10, 0   ; 10 means newline after text

; numbers | * Display text with number
num     dd      20  ; dd is used for integer variables

; identifiers for system calls | *standard in all programs
SYS_EXIT        equ     60
SYS_WRITE       equ     1
STDOUT          equ     1


;--------------------------
; Output [in terminal]
; Your number is: 20
;--------------------------