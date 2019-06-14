
#include "helpers.h"
#include <vector>

using namespace helpers;
using namespace std;

long long checkSum(vector <long long int> arr, int i, long long k, long long sum) {
    if (i == arr.size() - 1)
        return sum + arr[i];

    sum += arr[i];

    if (k == sum)
        return sum;
    
     sum += checkSum(arr, i + 1, k, sum);
    return sum;
}

bool check_if_sum_possible(vector <long long int> arr, long long int k) {
    // if (k == 0)
    //     return false;

    long long sum = 0;
    long long r = checkSum(arr, 0, k, sum);

    return r == k;
}

vector <string> find_all_well_formed_brackets(int n) {

}

int main(int argc, char const *argv[])
{
    vector <long long int> input = {2, -10, 10, 0};
    bool r = check_if_sum_possible(input, 0);
    cout << "r: " << r << '\n';

    return 0;
}
