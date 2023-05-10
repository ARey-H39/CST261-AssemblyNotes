# Assembly Integer Operations

Notes on arithmetic operations using integers.
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
