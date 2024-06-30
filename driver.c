#include <stdio.h>
#include <libIO.h>
#include <NumUtils.h>

#define MAX 20

int main(void) {

    char text[MAX];
    unsigned int num;

    writeStr("Enter an unsigned integer: ");
    readLn(text, MAX);

    decToUInt(text, &num);
    printf("\nInput:\n%5c %10d %10u 0x%010X\n\n", ' ', num, num, num);

    return 0;
}