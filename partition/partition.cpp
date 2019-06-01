#include "helpers.h"
#include <iostream>
#include <vector>

using namespace helpers;

void Partition(int a[], int startIndex, int endIndex, int pivotIndex)
{
    std::cout << " Pivot: " << a[pivotIndex] << '\n';

    std::swap(a[pivotIndex], a[endIndex]);
    PrintArray(a, 5);

    int i = startIndex;
    for (int curr = startIndex; curr < endIndex; ++curr)
    {
        // Compare the current value with the pivot
        if (a[curr] < a[endIndex])
        {
            std::swap(a[curr], a[i++]);
        }
        else if (a[curr] > a[endIndex])
        {
            std::swap(a[curr], a[i]);
        }
    }

    // Put the pivot in its place
    std::swap(a[i], a[endIndex]);
}

// Partition with O(2n) time and space complexity
void BruteForcePartition(int a[], int startIndex, int endIndex, int pivotIndex)
{
    // Determine number of indices <= the pivot value
    int le_size = 0;
    for (int i = startIndex; i < endIndex; i++)
    {
        if (a[i] <= a[pivotIndex])
        {
            ++le_size;
        }
    }

    // Create a new array for the partitioned version
    auto b = std::vector<int>(endIndex - startIndex + 1);

    // Copy the pivot into its correct location
    b[le_size] = a[pivotIndex];

    // Iterate over the input array, copying the contents either to the left of the pivot, or the
    // right
    int leIndex = startIndex;
    int gtIndex = le_size + 1;
    for (int i = startIndex; i <= endIndex; i++)
    {
        if (a[i] < a[pivotIndex])
        {
            b[leIndex++] = a[i];
        }
        else if (a[i] > a[pivotIndex])
        {
            b[gtIndex++] = a[i];
        }
    }

    PrintArray(&b[0], 5);
}

int main(int, char **)
{
    int a[] = {4, 8, 5, 7, 3};

    std::cout << "Before: ";
    // PrintArray(a, 5);
    PrintContainer(a, a + 5);
    BruteForcePartition(a, 0, 4, 0);
}
