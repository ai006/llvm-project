#include <stdio.h>

int age = 25;
float height = 1.75;
long long population = 7937000000;
double weight = 65.5;
char grade = 'A';
char greeting[10] = "Hello";

int main()
{
    printf("Age: %d\n", age);
    printf("Height: %.2f meters\n", height);
    printf("Population: %lld\n", population);
    printf("Weight: %.1f kg\n", weight);
    printf("Grade: %c\n", grade);


    return 0;
}