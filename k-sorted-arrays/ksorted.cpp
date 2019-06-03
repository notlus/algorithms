#include "helpers.h"
#include <queue>
#include <vector>

using namespace helpers;
using namespace std;

template <typename T> void print_queue(T &q)
{
    while (!q.empty())
    {
        std::cout << q.top().first << " ";
        q.pop();
    }
    std::cout << '\n';
}

using Blob = pair<int, int>;

vector<int> mergeArrays(vector<vector<int>> arr)
{
    int n = arr[0].size();

    bool ascending = true;
    for (int i = 0; i < arr.size() - 1; i++)
    {
        for (int j = 0; j < n - 2; j++)
        {
            if (arr[i][j] > arr[i][j + 1])
            {
                ascending = false;
                break;
            }
        }
    }

    vector<int> result;

    auto comparator = [ascending](Blob a, Blob b) {
        if (ascending)
            return a.first > b.first;
        else
            return a.first < b.first;
    };

    priority_queue<Blob, vector<Blob>, decltype(comparator)> heap(comparator);

    for (int j = 0; j < n; ++j)
    {
        for (int i = 0; i < arr.size(); ++i)
        {
            int v = arr[i][j];
            auto p = make_pair(v, j);
            heap.push(p);
        }

        while (heap.top().second < j)
        {
            result.push_back(heap.top().first);
            heap.pop();
        }
    }

    while (!heap.empty())
    {
        result.push_back(heap.top().first);
        heap.pop();
    }

    return result;
}

int main(int argc, char const *argv[])
{
    vector<vector<int>> v{{1, 3, 5, 7}, {2, 4, 6, 8}, {0, 9, 10, 11}};
    // vector<vector<int>> v{{34, 26, 20, 13, 11, 7, 4, 4},
    //                       {41, 34, 27, 23, 19, 10, 8, 0},
    //                       {26, 25, 19, 12, 7, 7, 7, 5}};
    auto ksorted = mergeArrays(v);
    PrintContainer(ksorted.begin(), ksorted.end());

    return 0;
}
