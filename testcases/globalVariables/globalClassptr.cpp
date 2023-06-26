#include <iostream>

class MyClass {
public:
    char array[10];
    int long number;
    void myMethod() {
        std::cout << "Hello from MyClass!" << std::endl;
    }
};

// Global class pointer
MyClass* globalPointer = nullptr;

int main() {
    MyClass obj;
    
    // Assign the address of the object to the global pointer
    globalPointer = &obj;
    
    // Access the object through the global pointer
    globalPointer->myMethod();
    
    return 0;
}
