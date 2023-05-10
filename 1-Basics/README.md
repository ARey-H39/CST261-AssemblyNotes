# Assembly Basics

Notes on displaying texts and numbers, and reading user inputs.
<br></br>

## **Basics #1 | Displaying text**

_(Start with `rax` register)_

1. Define the SYS_WRITE system call in the “rax” register
2. Define STDOUT (standard output) in “rdi” register
3. Insert the string you want to output in “rsi” register, and the length of the string in the “rdx” register
4. Make sure you define these variables in “section .data”

    <br>

    ___Example___

    In section .text:
    ```assembly
    mov     rax, SYS_WRITE
    mov     rdi, STDOUT
    mov     rsi, showMessage
    mov     rdx, messageLength 
    syscall
    ```

    In section .data
    ```assembly
    showMessage     db      "Hello world", 10
    messageLength   equ     $-showMessage
    ```

    <br>

More detailed explanation and example in [01_showText.asm](01_showText.asm).

<br></nr>

## **Basics #2 | Print numbers**

Need to use `printf` method by importing it.  
Also may require you to update code-runner nasm setting

_(Start with `rdi` register)_

1. Make sure printf is imported using `extern printf`
2. Define string template in `rdi` register.
3. Define number to display in `rsi` register.
4. Set `rax` register to 0 (1 if a float is outputed)
5. Run the `printf` method as defined.

_Follow register order: `rax`, `rdi`, `rsi`, `rdx`, `rcx`, `r8`, `r9`, ..., `r15`_

<br>

See [02-a_printNum.asm](02-a_printNum.asm) and [02-b_printManyNum.asm](02-b_printManyNum.asm) for examples and more details.

<br></br>

## **Basics #3 | User inputs _(take and display)_**

Need to use `scanf` method by importing it.   
Also may require you to update code-runner nasm setting

_(Start with `rdi` register)_

1. Make sure `scanf` is imported using `extern scanf`
2. Define input format into `rdi`
3. Define the location where the input will be stored (a variable name)
    1. Make sure you reserve the bythes for this variable in the `section .bss`
4. Set `rax` to 0
5. Run the `printf` method

_Formats: `%s` for string, `%d` for integers, `%lf` or `%f` for floats_

You can display these inputs using `printf`

Note: It's a good idea to store the user input in a register before using it in `printf`

<br>

See [03-a_userInput.asm](03-a_userInput.asm) as [03-b_displayUserInput.asm](03-b_displayUserInput.asm) for examples and more details.
