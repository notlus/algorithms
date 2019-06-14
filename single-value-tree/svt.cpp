#include "helpers.h"
#include <iostream>
#include <vector>

using namespace helpers;
using namespace std;

class TreeNode
{
  public:
    TreeNode(int v) : val(v)
    {}

    int val;
    TreeNode *left_ptr = nullptr;
    TreeNode *right_ptr = nullptr;
};

int findSingleValueTrees(TreeNode *root)
{
    if (!root)
        return 0;

    if (!root->left_ptr && !root->right_ptr)
        // Leaf
        return 1;

    int v = 0;
    if (root->left_ptr)
        v += findSingleValueTrees(root->left_ptr);

    if (root->right_ptr)
        v += findSingleValueTrees(root->right_ptr);

    if (!root->right_ptr)
    {
        // No right child and left child is equal to root
        if (root->left_ptr && root->left_ptr->val == root->val)
            v++;
    }
    else if (!root->left_ptr)
    {
        // No left child and right child is equal to root
        if (root->right_ptr && root->right_ptr->val == root->val)
            v++;
    }
    else
    {
        // Left and right children are equal to root
        if (root->left_ptr->val == root->val && root->right_ptr->val == root->val)
            v++;
    }
    
    return v;
}

int main(int argc, char const *argv[])
{
    TreeNode *root = new TreeNode(1);

    TreeNode *tn1 = new TreeNode(1);

    TreeNode *tn2 = new TreeNode(1);

    root->left_ptr = tn1;
    root->right_ptr = tn2;

    TreeNode *tn3 = new TreeNode(1);
    tn1->left_ptr = tn3;

    TreeNode *tn4 = new TreeNode(1);
    tn1->right_ptr = tn4;

    int v = findSingleValueTrees(root);
    cout << "Number of single value trees: " << v << '\n';
    return 0;
}
