# Assembly Notes | Conversion and Jumps

Notes on converting integers to floats and program jumps.
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
