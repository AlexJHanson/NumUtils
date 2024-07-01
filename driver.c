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
    printf("\nInput:\n%5c %10d %10u 0x%08X\n\n", ' ', num, num, num);

    writeStr("Enter an signed integer (- for negative | + optional for positive): ");
    readLn(text, MAX);

    decToSInt(text, &num);
    printf("\nInput:\n%5c %10d %10u 0x%08X\n\n", ' ', num, num, num);

    writeStr("Enter an unsigned integer: ");
    readLn(text, MAX);

    decToUInt(text, &num);
    num += 123;

    intToUDec(text, num);

    writeStr(text);
    writeStr("\n");

    return 0;
}