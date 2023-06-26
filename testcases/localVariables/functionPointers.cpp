#include <iostream>

// Function with matching signature
int add(int a, int b) {
    return a + b;
}

// Function with matching signature
int subtract(int a, int b) {
    return a - b;
}

// Function that takes two integers and a function pointer
int performOperation(int a, int b, int (*operation)(int, int)) {
    return operation(a, b);
}

int main() {
    // Define function pointers
    int (*funcPtr)(int, int);

    // Assign the address of 'add' function to the function pointer
    funcPtr = &add;

    // Call the function through the function pointer
    int result = funcPtr(5, 3);
    std::cout << "Result of add function: " << result << std::endl;

    return 0;
}
