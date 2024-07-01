# intToUDec.s
# Converts an unsigned int to its string representation
# Input:
#       rdi <- (char *) Location to store string representation
#       esi <- Unsigned int to convert
            .intel_syntax noprefix
# Constants
            .equ    ASCII,      0x30
            .equ    NULL,       0x00
            .equ    RADIX,      10
# Local Variables
            .equ    tmpArry,   -12
            .equ    localSize, -16
# Code
            .text
            .globl  intToUDec
            .type   intToUDec, @function
intToUDec:
            push    rbp
            mov     rbp, rsp 
            add     rsp, localSize

            mov     ecx, RADIX
            lea     r8, tmpArry[rbp]      # Load address of temp array

            mov     BYTE PTR [r8], NULL   # Start tmp string with NULL in order to work backwards. Remainder is 
            add     r8, 1                 # caculated through repeated division and digits are stored in reverse
            mov     eax, esi
while_convert:
            mov     edx, 0                # Zero out remainder register
            div     ecx                   # Divsor = RADIX = 10

            or      dl, ASCII             # Convert to ASCII digit format
            mov     [r8], dl              # Store char representation in tmp array
            add     r8, 1                 # (char *)++

            cmp     eax, 0                # Does dividend = 0?
            jne     while_convert         # No, back to top
while_reverse:
            sub     r8, 1                 # Go back to last digit stored
            mov     al, [r8]              # Move char digit to arugment array
            mov     [rdi], al
            add     rdi, 1                # Increment (char *) arg to next storage location
            cmp     al, NULL              # Is the character just read NULL?
            jne     while_reverse         # No, back to top

            mov     eax, 0                # Epilogue 
            mov     rsp, rbp
            pop     rbp
            ret
