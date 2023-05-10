# **CST261** - Assembly Basics
Notes on NASM Assembly from CST 261
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

<br></br>

## **#4 Integer Operations | Add**

_(Example assumes you want to output each number, and you are taking numbers as user input)_

1. Save integers into registers (whether user input or hard coded ints)
2. Clear out a register where the sume will be stored (Set it to 0)
3. Use add operators on that register
    1. add num1 into sum
    2. add num2 into sum
    3. now sum is num1 + num2

<br>

See [04_addIntegers.asm](04_addIntegers.asm) for example and more details.

<br></br>

## **#5 Integer Operations | Subtract**

_(Example assumes you want to output each number, and you are taking numbers as user input)_

1. Save integers into registers (whether user input or hard coded ints)
2. Copy first number into a register where result will be stored
3. Use subtract operatore on that register
    1. subtract num2 from number in result register
    2. Now result = num1 - num2

<br>

See [05_subtractIntegers.asm](05_subtractIntegers.asm) for example and more details.

<br></br>

## **#6 Integer Operations | Multiply**

_(Example assumes you want to output each number, and you are taking numbers as user input)_

1. Save integers into registers (whether user input or hard coded ints)
2. Copy num1 into a register where result will be stored
3. Use multiply operator on that register:
    1. multiply num2 by the number stored in result register
    2. result = num1 * num2

Here we use the `imul` operator instead of `mul` as it is less complicated to use.

<br>

See [06_multiplyIntegers.asm](06_multiplyIntegers.asm) for example and more details.

<br></br>

## **#7 Integer Operations | Divide**

_(Example assumes you want to output each number, and you are taking numbers as user input)_

Division is a little more complicated than the other integer operations.  
- `rax` is the register where all division happens and where the result is stored.
- `rdx` is the register where the remainder is stored.

You have make these registers work for you like in the example.

1. Copy first number to `rax` | * must be saved to `rax`
2. Copy second number to any other register
3. For output purposes, make a copy of `raz` into another register (making a copy of num1)
4. Clear out `rdx` to store remainder | remainder is automatically stored in `rdx`
5. Use division operator:
    1. divide number in rax by num2
    2. now rax = num1 ; num2
    3. and rdx is the remainder of that

<br>

See [07_divideIntegers.asm](07_divideIntegers.asm) for example and more details.

<br></br>

## **#8 Floating Point Operations | Display Floats**

Need to use printf method by importing it.  
Also may require you to update code-runner nasm settings.

_(Introducing new (xmm) registers and (q) operators)_

1. Make sure printf is imported using `extern printf`
2. Define string template in `rdi` register.
3. Define number to display in `xmm0` register.
4. Define any other numbers in `xmm1`...`xmm15` registers.
5. Set `rax` register to 1. <-- 1 is for printing floats
6. Run the `printf` method.

\* When using xmm registers, do not use `mov` operator, use `movq`

\* Reserve a floating variable in `section .bss` using `resq` instead of `resb`

\* Input format for floats is `%lf` instead of `%d`

See [08_displayFloats.asm](./08_displayFloats.asm) for example and more details.

<br></br>

## **#9 Floating Point Operations | Add**

_(Example assumes you want to output each number, and you are taking numbers as user input)_

_(Introduces new (sd) operators)_

1. Save floats into xmm registers using `movsd` (whether user inpu or hard coded floats)
2. Clear out an xmm register where the sum will be stored (Set it to `0` using `pxor`) * `pxor` is `xor` for floats
3. Add float1 into sum
4. Add float2 into sum
5. Now sum is float1 + float2

\* "sd" operators are used for math operation on floats

\* Node: use `movsd` when moving floating numbers into xmm when you intend to do math on them.

See [09_addFloats.asm](./09_addFloats.asm) for example and more details.

<br></br>

## **#10 Floating Point Operations | Subtract**

_(Example assumes you want to output each number, and you are taking numbers as user input)_

1. Save floats into xmm registers (whether user input or hard coded floats)
2. Copy first number into a register where result will be stored
3. Use subtract operator on that register
    1. Subtract num2 from number stored in result register
    2. Now result = num1 - num2

See [10_subtractFloats.asm](./10_subtractFloats.asm) for example and more details.

<br></br>

## **#11 Floating Point Operations | Multiply**

_(Example assumes you want to output each number, and you are taking numbers as user input)_

1. Save floats into xmm registers (whether user input or hard coded floats)
2. Copy num1 into a register where result will be stored
3. Use multiply (`mulsd`) operator on that register
    1. Multiply num2 by the number stored in result register
    2. Now result = num1 * num2

See [11_multiplyFloats.asm](./11_multiplyFloats.asm) for example and more details.

<br></br>

## **#12 Floating Point Operations | Divide**

_(Example assumes you want to output each number, and you are taking numbers as user input)_

1. Save floats into xmm registers (whether user input or hard coded floats)
2. Copy num1 into a register where result will be stored
3. Use divide (`divsd`) operator on that register
    1. Divide number stored in result register by num2
    2. Now result = num1 / num2

See [12_divideFloats.asm](./12_divideFloats.asm) for example and more details.

<br></br>

## **#13 Conversion Operations | Integer to Floating Point**

_(Example assumes you want to output each number, and you are taking numbers as user input)_

When doing math operations, both numbers must be of the same type.  
Most commonly, you will have to convert integers into floats to add, subtract, multiply, or divide between the two.

1. Copy numbers into appropriate registers.
2. Use `cvtsi2sd` to convert integer to float (or double) and save to an xmm register
3. Now you should be able to do math operations on these numbers

See [13_convertIntToFloat.asm](./13_convertIntToFloat.asm) for example and more details.

<br></br>

## **#14 Selections | Jumps: Comparing Numbers**

Assembly has operators used to make decisions on which part of the program should run based on certain conditions, like if two numbers equal each other.

First, its important to understand that your program's `section .text` can be separated into 'labels' that we can "jump" to.  
_(_start is an example of a label)_

To "jump" to a label without any kinds of conditions needinf to be met, simply use the `jmp` operator.

To compare two numbers and "jump" to a separate label id they are equal or not equal:

1. Save numbers to registers
2. Use `cmp` operator to compare two numbers
3. Use `je` to jump to a label if two number are equal
4. Use `jne` to jum to label if two numbers are not equal

\* You don't have to use both `je` and `jne` if you don't need to, think of them like `if/else`

See [14_selectionComparisons.asm](./14_selectionComparisons.asm) and [14_selectionComparisons.asm](./14_selectionComparisons.asm) for examples and more details.
