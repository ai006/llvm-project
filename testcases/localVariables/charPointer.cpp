#include <stdio.h>

int main() {
    char* strPtr;  // Declaration of string pointer

    char str[] = "Hello";
    strPtr = str;  // Assigning the address of the string to the pointer

    printf("String: %s\n", strPtr);  // Printing the string using the pointer

    return 0;
}
