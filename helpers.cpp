#include "helpers.h"
#include <iostream>

namespace helpers {

void PrintArray(int a[], int size)
{
    for (int i = 0; i < size; ++i)
    {
        std::cout << a[i] << " ";
    }

    std::cout << std::endl;
}

} // namespace helpers