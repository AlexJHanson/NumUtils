# Integer utilities written in assembly language 
<span style="font-size:20px; font-weight: bold;">x86_64 &nbsp;&nbsp; Architecture &nbsp;&nbsp;Linux Ubuntu</span>

## Interface &nbsp;&nbsp;<NumUtils.h>

__void decToUInt(char *s, unsigned int *num)__

Converts a decimal string to an unsigned int. Stores unsigned int in 
pointer to unsigned int.

return void

*__NOTE: Does not check overflow- Strings with more than 10 digits or that represent numbers greater than 4,294,967,295 will produce incorrect results. Strings should not be prefixed with + sign.__*

__void decToSInt(char *s, int *num)__

Converts a decimal string to a signed int. Strings can have +/- prefex, strings with no prefix are assumed positive. Stores int in pointer to int.

return void

*__NOTE: Does not check overflow- Strings with more than 10 digits, that represent numbers greater than 2,147,483,647, or that represent numbers less than -2,147,483,648 will produce incorrect results.__*

__void intToUDec(char *s,  unsigned int num)__

Converts an unsigned int to a decimal string representation. 

*__NOTE: Caller is responsible for providing an array large enough to hold the maximum amount of possible digits (10 for unsigned and signed ints) and terminating NULL character. (11 chars)__*


__void intToSDec(char *s,  int num)__

Converts a signed int to a decimal string representation. Negative numbers are prepended with a - sign.

*__NOTE: Caller is responsible for providing an array large enough to hold the maximum amount of possible digits (10 for unsigned and signed ints), possible - sign for negative numbers, and terminating NULL character. (12 chars)__*

## Using the library

provided as libNumUtils.so

gcc link command *__-lNumUtils__* 

