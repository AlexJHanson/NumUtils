# intToSDec.s
# Converts signed int to string representation
# Input:
#       rdi <- (char *) output string
#       esi <- int to convert to string
# Returns 0
        .intel_syntax   noprefix
# Constants
        .equ    SIGN_BIT,       0X80000000
        .equ    TWOS_COMP_MASK, 0xFFFFFFFF 
# Code
        .text
        .globl  intToSDec
        .type   intToSDec, @function
intToSDec:
        push    rbp
        mov     rbp, rsp

        mov     edx, esi
        and     edx, SIGN_BIT              # Mask out all other bits in number except sign, if it is set

        cmp     edx, SIGN_BIT              # Is the sign bit set? If not convert positive number to string
        jne     convert

        mov     BYTE PTR [rdi], '-'        # If the sign bit is set, first character is negative sign
        add     rdi, 1                     # Increment (char*) beyond sign char

        cmp     esi, SIGN_BIT              # Is num INT_NEG_MAX? If so treat as unsigned INT_MAX + 1 
        je      convert                    # and do not apply 2's compliment

        xor     esi, TWOS_COMP_MASK        # 2's Compliment value to get back to positive represention of value
        add     esi, 1                     # for the unsigned routine to work corectly

convert:
        call    intToUDec                  # Argument registers already have the right values

        mov     eax, 0                     # Epilogue. No stack usage
        pop     rbp 
        ret     
