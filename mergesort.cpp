#include "helpers.h"
#include <iostream>
#include <vector>

using namespace helpers;

// Merge two sorted arrays
void Merge(int a[], int startIndex, int midPoint, int endIndex)
{
    // Create two auxilliary arrays to operate on
    std::vector<int> left(midPoint - startIndex);
    std::vector<int> right(endIndex - midPoint);

    int i, j, k = 0;

}

// Sort input array `a` using the mergesort algorithm.
void MergeSort(int a[], int startIndex, int endIndex)
{
    if (startIndex >= endIndex)
        return;

    int mid = startIndex + (endIndex - startIndex) / 2;
    MergeSort(a, startIndex, mid);
    MergeSort(a, mid + 1, endIndex);
    Merge(a, startIndex, mid, endIndex);
}

int main(int argc, char const *argv[])
{
    int a[] = {4, 8, 5, 7, 3};

    std::cout << "Before: ";
    PrintArray(a, 5);

    MergeSort(a, 0, 4);

    std::cout << " After: ";
    PrintArray(a, 5);

    return 0;
}
