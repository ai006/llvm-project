#include <stdio.h>

// Declare a global array
int globalArray[5] = {1, 2, 3, 4, 5};

int main() {
    // Declare a local pointer
    int* localPtr = globalArray;

    // Modify the values of the array using the local pointer
    for (int i = 0; i < 5; i++) {
        localPtr[i] *= 2;
    }

    // Print the modified values of the global array
    for (int i = 0; i < 5; i++) {
        printf("%d ", globalArray[i]);
    }
    printf("\n");

    return 0;
}
