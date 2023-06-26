#include <iostream>

// Function declaration
int Add(int a, int b) {
    return a + b;
}

int Subtract(int a, int b) {
    return a - b;
}

int Multiply(int a, int b) {
    return a * b;
}

int main() {
    // Declaration of function pointers
    int (*operation)(int, int);

    // Assigning the address of the Add function to the function pointer
    operation = Add;

    // Using the function pointer to call the Add function
    int result = operation(4, 2);
    std::cout << "Addition result: " << result << std::endl;

    // Assigning the address of the Subtract function to the function pointer
    operation = Subtract;

    // Using the function pointer to call the Subtract function
    result = operation(4, 2);
    std::cout << "Subtraction result: " << result << std::endl;

    // Assigning the address of the Multiply function to the function pointer
    operation = Multiply;

    // Using the function pointer to call the Multiply function
    result = operation(4, 2);
    std::cout << "Multiplication result: " << result << std::endl;

    return 0;
}
