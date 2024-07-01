# decToUInt.s
# Converts decimal character string to unsigned 32-bit int.
# Input:
#       rdi <- (char*) decimal characters
#       rsi <- Unsigned int output (4 bytes)     
# Returns 0
        .intel_syntax noprefix
# Constants
        .equ    RADIX,    0x0A
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
        mov     eax, 0                  # Zero out high order bits
        mov     al, [rdi]               # Get first char
while:
        cmp     al, NULL                # While NOT NULL
        je      end
        and     eax, NUM_MASK           # Cast char to 32 bit int
        mov     ecx, [rsi]
        imul    ecx, ecx, RADIX         # Increase by a factor of radix to make space for new digit
        add     ecx, eax                # Add digit
        mov     [rsi], ecx              # Store result
        inc     rdi                     # (char*)++
        mov     al, [rdi]               # Get next char
        jmp     while                   # Back to top
end:
        mov     eax, 0
        pop     rbp
        ret
