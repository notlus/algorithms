#include "helpers.h"
#include <vector>

using namespace helpers;
using namespace std;

vector<int> merger_first_into_second(vector<int> arr1, vector<int> arr2) {
    if (arr1.empty())
        return arr2;

    int alast = arr1.size() - 1;
    int blast = alast;
    int rlast = arr2.size() - 1;

    while (rlast >= 0) {
        if (arr1[alast] > arr2[blast]) {
            arr2[rlast--] = arr1[alast--];
        }
        else if (arr1[alast] <= arr2[blast]) {
            arr2[rlast--] = arr2[blast--];
        }
        else
        {
            arr2[rlast--] = arr1[alast--];
            blast--;
        }
        
    }
    return arr2;
}

int main(int argc, char const *argv[])
{
    vector<int> a1 {1, 3, 5};
    vector<int> a2 {2, 4, 6, 0, 0, 0};
    // vector<int> a1 {1};
    // vector<int> a2 {1, 0};

    auto result = merger_first_into_second(a1, a2);
    PrintContainer(result.begin(), result.end());
    
    return 0;
}
