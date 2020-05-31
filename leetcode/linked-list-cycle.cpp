#include <memory>

// https://leetcode.com/problems/linked-list-cycle
// clang -std=c++17 -lc++ -Wall linked-list-cycle.cpp -o linked-list-cycle

/**
 * Definition for singly-linked list.
 */
struct ListNode
{
    int val;
    ListNode *next;
    ListNode(int x) : val(x), next(nullptr)
    {
    }
};

class Solution
{
  public:
    bool hasCycle(ListNode *head)
    {
        if (!head)
        {
            return false;
        }

        ListNode *slow = head;
        ListNode *fast = head;

        while (slow)
        {
            if (fast && fast->next)
            {
                fast = fast->next->next;
            }
            else
            {
                return false;
            }

            slow = slow->next;
            if (slow == fast)
            {
                return true;
            }
        }

        return false;
    }
};

auto main() -> int
{
    auto n1  = new ListNode(1);
    auto n2  = new ListNode(2);
    auto n3  = new ListNode(3);
    auto n4  = new ListNode(4);
    n1->next = n2;
    n2->next = n3;
    n3->next = n4;
    n4->next = n1;

    auto s = Solution();
    if (s.hasCycle(n1))
    {
        printf("Cycle detected\n");
    }
    else
    {
        printf("No cycles found\n");
    }

    return 0;
}