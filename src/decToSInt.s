# decToSInt.s
# Converts decimal string input to signed 32 bit integer
# Input:
#       rdi <- (char*) decimal characters
#       rsi <- (int*) signed int output (4 bytes)
# Returns 0
        .intel_syntax noprefix
# Constants
        .equ    MAX_NEGATIVE, 0x80000000    # -2,147,483,648
# Locals
        .equ    negative,  -4
        .equ    localSize, -16
# Code
        .text
        .globl decToSInt
        .type  decToSInt, @function
decToSInt:
        push    rbp
        mov     rbp, rsp
        add     rsp, localSize

        cmp     BYTE PTR [rdi], '-'         # Check if first character indicates a negative number
        jne     plus_sign                   # If not negative, check for an explicit plus sign
        mov     DWORD PTR negative[rbp], 1  # Set negative flag
        add     rdi, 1                      # (char *)++ Skip that sign character
        jmp     convert                     # Go to conversion
plus_sign:
        mov     DWORD PTR negative[rbp], 0  # Number is assummed positive
        cmp     BYTE PTR [rdi], '+'         # Is there a plus sign
        jne     convert                     # If not, jump to conversion
        add     rdi, 1                      # If there is, skip it (char *)++
convert:
        call    decToUInt                   # Convert number: As long as number <= MAX_INT conversion will be correct

        cmp     BYTE PTR negative[rbp], 0
        je      end

        cmp     DWORD PTR [rsi], MAX_NEGATIVE # unsigned function will have generated unsigned INT_MAX + 1 for MAX_NEGATIVE,
        je      end                           # This number is already in the correct 2's compliment form

        neg     DWORD PTR [rsi]               # For negative numbers with |num| <= MAX_INT 2's compliment value
end:
        mov     eax, 0
        mov     rsp, rbp
        pop     rbp
        ret 

