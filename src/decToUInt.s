# decToUInt.s
# Converts decimal character string to unsigned 32-bit int.
# Input:
#       rdi <- (char*) decimal characters
#       rsi <- Unsigned int output (4 bytes)     
# Returns 0  
        .intel_syntax noprefix
# Constants
        .equ    RADIX,  10
        .equ    NUM_MASK, 0x0f
        .equ    NULL,     0
# Code
        .text
        .globl  decToUInt
        .type   decToUInt, @function
decToUInt:
        push    rbp
        mov     rbp, rsp

        mov     DWORD PTR [rsi], 0      # Initialize unsigned result
        mov     al, [rdi]               # Get first char
while:
        cmp     al, NULL                # While NOT NULL
        je      end
        and     eax, NUM_MASK           # Cast char to 32 bit int
        mov     ecx, [rsi]
        imul    ecx, ecx, RADIX         # Increase by a factor of radix (10) to make space for new int in 1's place base 10
        add     ecx, eax                # Add digit
        mov     [rsi], ecx              # Store result
        inc     rdi                     # (char*)++
        mov     al, [rdi]               # Get next char
        jmp     while                   # Back to top
end:
        mov     eax, 0
        pop     rbp
        ret