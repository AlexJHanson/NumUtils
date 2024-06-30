# sumRange.s
# Sum the all integers between in the interval (a,b)
        .intel_syntax   noprefix
# Calling sequence:
#       edi <- a
#       esi <- b
# Returns the summation of interval (a,b) where a < b
# Code
        .text
        .globl  sumRange
        .type   sumRange, @function
sumRange:                       # Prologue
        push    rbp             # Save caller's stack frame pointer
        mov     rbp, rsp        # Set new frame pointer

        cmp     edi, esi        # Determine lower bound of range
        jle     for             # If a <= b go to for loop, otherwise swap a, b
        mov     ecx, esi        # Store b in temp
        mov     esi, edi        # Move a to b
        mov     edi, ecx        # Move temp to a

        mov     eax, 0          # Initialize sum to zero
for:
        add     edi, 1          # Move to next integer in interval
        cmp     edi, esi        # Is lower bound >= upper bound?
        jge     end             # If so, end function
        add     eax, edi        # Add current integer in interval to sum
        jmp     for             # Go back to top of loop
end:
        pop     rbp             # Truncated epilogue, stack pointer == frame pointer
        ret




