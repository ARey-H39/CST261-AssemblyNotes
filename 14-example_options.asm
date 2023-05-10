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
        mov     rsi, num
        xor     rax, rax
        call scanf

        ; Store input to register
        mov     r12, [num]

        ; Compare input to multiple numbers
        mov     r13, turnOn         ; "loaded" option 1 into register
        cmp     r12, r13            ; compare input with number
        je      setToOn             ; jump to setToOn if equal
        
        mov     r13, turnOff        ; "loaded" option 2 into register
        cmp     r12, r13            ; compare input with number
        je      setToOff            ; jump to setToOff if equal

        jmp     exit                ; else, jump to exit

setToOff:
        mov     rsi, textOff
        mov     rdx, textOffSize
        jmp     outputMessage

setToOn:
        mov     rsi, textOn
        mov     rdx, textOnSize
        jmp     outputMessage

outputMessage:
        mov     rax, SYS_WRITE
        mov     rdi, STDOUT
        ; rsi should already be filled 
        ; rdx should already be filled
        syscall
        
        jmp exit

exit:
        mov     rax, SYS_EXIT
        xor     rdi, rdi
        syscall

        section     .data
prompt          db      "Enter 1 or 0 to set power on or off: "
promptLength    equ     $-prompt

;define the values we will compare the input with
turnOn      equ     1
turnOff     equ     0

textOff         db      "Power is set to off.", 10
textOffSize     equ     $-textOff
textOn          db      "Power is set to on.", 10
textOnSize      equ     $-textOn

inputFormat     db      "%d", 0

SYS_EXIT    equ     60
SYS_WRITE   equ     1
STDOUT      equ     1

        section     .bss
num     resb    8
