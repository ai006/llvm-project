#include <iostream>
#include <unordered_map>

int main() {
    // Create an unordered_map with key-value pairs of string-int
    std::unordered_map<std::string, int> myMap;

    // Insert elements into the hashmap
    myMap["apple"] = 5;
    myMap["banana"] = 3;
    myMap["orange"] = 8;

    // // Accessing elements in the hashmap
    // std::cout << "Number of apples: " << myMap["apple"] << std::endl;

    // // Updating the value of an existing key
    // myMap["banana"] = 10;

    // // Check if a key exists in the hashmap
    // if (myMap.count("orange") > 0) {
    //     std::cout << "Oranges are present." << std::endl;
    // }

    // // Iterate over the hashmap
    // for (const auto& pair : myMap) {
    //     std::cout << "Key: " << pair.first << ", Value: " << pair.second << std::endl;
    // }

    // // Erase an element from the hashmap
    // myMap.erase("apple");

    // // Clear all elements in the hashmap
    myMap.clear();

    return 0;
}
