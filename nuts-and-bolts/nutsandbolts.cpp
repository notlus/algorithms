
#include "helpers.h"
#include <unordered_set>
#include <vector>

using namespace helpers;
using namespace std;

vector<string> solve(vector<int> nuts, vector<int> bolts)
{
    vector<string> result;
    unordered_set<int> s;

    int N = nuts.size();
    int j = 0;
    for (int i = 0; i < N; i++)
    {
        if (nuts[i] == bolts[j])
        {
            string nutsbolts = to_string(nuts[i]);
            nutsbolts += " ";
            nutsbolts += to_string(bolts[j]);
            result.push_back(nutsbolts);
            j++;

            // Check whether `j` already has a match
            auto elem = s.find(bolts[j]);
            if (elem != s.end())
            {
                // Found a match
                string nutsbolts = to_string(*elem);
                nutsbolts += " ";
                nutsbolts += to_string(bolts[j]);
                result.push_back(nutsbolts);
                s.erase(bolts[j]);
            }
        }
        else
        {
            s.insert(nuts[i]);
        }
    }

    while (!s.empty())
    {
        j++;
        auto elem = s.find(bolts[j]);
        if (elem != s.end())
        {
            string nutsbolts = to_string(*elem);
            nutsbolts += " ";
            nutsbolts += to_string(bolts[j]);
            result.push_back(nutsbolts);
            s.erase(bolts[j]);
        }
    }

    return result;
}

int main(int argc, char const *argv[])
{
    vector<int> nuts{38, 32, 35, 9, 19, 21};
    vector<int> bolts{32, 35, 21, 38, 19, 9};

    // vector<int> nuts{4, 32, 5, 7};
    // vector<int> bolts{32, 7, 5, 4};

    auto result = solve(nuts, bolts);
    PrintContainer(result.begin(), result.end());

    return 0;
}
