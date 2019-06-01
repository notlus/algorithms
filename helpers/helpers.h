#include <iostream>

namespace helpers {

void PrintArray(int a[], int size);

template <typename ForwardIterator> void PrintContainer(ForwardIterator first, ForwardIterator last)
{
    while (first != last)
    {
        std::cout << *first << ' ';
        ++first;
    }

    std::cout << std::endl;
}

} // namespace helpers
