#include "helpers.h"
#include <algorithm>
#include <iostream>
#include <vector>

using namespace std;
using namespace helpers;

void dutchFlagPartition(vector<char> &balls)
{
    auto r = std::partition(balls.begin(), balls.end(), [](char c) {
        if (c == 'R')
            return true;

        return false;
    });

    r = std::partition(r, balls.end(), [](char c) {
        if (c == 'G')
            return true;

        return false;
    });
}

int main(int, char **)
{
    vector<char> v{'G', 'B', 'G', 'G', 'R', 'B', 'R', 'G'};

    PrintContainer(v.begin(), v.end());

    dutchFlagPartition(v);

    PrintContainer(v.begin(), v.end());
}
