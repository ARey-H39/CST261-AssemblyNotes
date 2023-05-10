# Assembly Floating Point Operations

Notes on diplaying floats and using arithmetic operations on floats.
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
