#include <stdio.h>

// Define the struct
struct MyStruct {
    int myInt;
    long myLong;
    int myArray[5];
};

int main() {
    // Create an instance of the struct
    struct MyStruct myInstance;

    // Assign values to the struct variables
    myInstance.myInt = 42;
    myInstance.myLong = 1234567890;
    for (int i = 0; i < 5; i++) {
        myInstance.myArray[i] = i;
    }

    // Access and print the values of the struct variables
    printf("myInt: %d\n", myInstance.myInt);
    printf("myLong: %ld\n", myInstance.myLong);
    printf("myArray: ");
    for (int i = 0; i < 5; i++) {
        printf("%d ", myInstance.myArray[i]);
    }
    printf("\n");

    return 0;
}
