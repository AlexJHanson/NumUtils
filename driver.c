#include <stdio.h>
#include <libIO.h>
#include <NumUtils.h>

#define MAX 20

int main(void) {

    char text[MAX];
    unsigned int u_num;
    int num;

    writeStr("Enter an unsigned integer: ");
    readLn(text, MAX);

    decToUInt(text, &u_num);
    printf("\nInput:\n%5c %10d %10u 0x%08X\n\n", ' ', u_num, u_num, u_num);

    writeStr("Enter a signed integer (- for negative | + optional for positive): ");
    readLn(text, MAX);

    decToSInt(text, &num);
    printf("\nInput:\n%5c %10d %10u 0x%08X\n\n", ' ', num, num, num);

    writeStr("Enter an unsigned integer: ");
    readLn(text, MAX);

    decToUInt(text, &u_num);

    writeStr("+ 123 = ");
    u_num += 123;

    intToUDec(text, u_num);

    writeStr(text);
    writeStr("\n");

    writeStr("Enter an integer: ");
    readLn(text, MAX);

    decToSInt(text, &num);

    if(num < 0) {
        writeStr("The integer -100 is ");
        num -= 100;
    } else {
        writeStr("The integer +100 is ");
        num  += 100;
    }

    intToSDec(text, num);

    writeStr(text);

    writeStr("\n");

    return 0;
}
