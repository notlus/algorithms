
#include "helpers.h"
#include <iostream>
// #include <vector>

using namespace helpers;
using namespace std;

class TreeNode
{
  public:
    TreeNode(int v) : val(v)
    {
    }
    int val;
    TreeNode *left_ptr = nullptr;
    TreeNode *right_ptr = nullptr;
};

bool isLeaf(TreeNode *node)
{
    return !node->left_ptr && !node->right_ptr;
}

int findMax(TreeNode *node)
{
    if (!node)
        return 0;

    if (isLeaf(node))
        return node->val;

    int lMax = findMax(node->left_ptr);
    int rMax = findMax(node->right_ptr);
    
    return std::max(lMax, rMax);
}

bool isBST(TreeNode *root)
{
    if (!root)
        return true;

    if (isLeaf(root))
        return true;

    if (root->left_ptr && root->left_ptr->val > root->val)
    {
        return false;
    }

    if (root->right_ptr && root->right_ptr->val < root->val)
    {
        return false;
    }

    int lMax = 0;
    int rMax = std::numeric_limits<int>::max();
    if (root->left_ptr)
    {
        lMax = findMax(root->left_ptr);
    }

    if (root->right_ptr)
    {
        rMax = findMax(root->right_ptr);
    }

    bool result = lMax < rMax;

    return result;
}

int main(int argc, char const *argv[])
{
/*
5           - nodes
3 2 4 1 4   - values
0           - root
4           - edges
0 1 L       - parent index, child index, left/right
0 2 R
1 3 L       - tn1, tn3
1 4 R       - tn1, tn4
*/    
    TreeNode *tn0 = new TreeNode(3);
    TreeNode *tn1 = new TreeNode(2);
    TreeNode *tn2 = new TreeNode(4);
    TreeNode *tn3 = new TreeNode(1);
    TreeNode *tn4 = new TreeNode(4);

    tn0->left_ptr = tn1;
    tn0->right_ptr = tn2;

    tn1->left_ptr = tn3;
    tn1->right_ptr = tn4;

    // tn0->left_ptr = tn1;
    bool r = isBST(tn0);
    cout << "Result: " << r << '\n';

    return 0;
}
