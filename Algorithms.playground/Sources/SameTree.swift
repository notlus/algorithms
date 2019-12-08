/// https://leetcode.com/problems/same-tree/

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class Solution {
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil, q == nil {
            return true
        }

        // Check first tree
        var pInOrder = [Int]()
        if let n = p {
            inorder(n, &pInOrder)
        }
        print("pInOrder: \(pInOrder)")

        // Check second tree
        var qInOrder = [Int]()
        if let n = q {
            inorder(n, &qInOrder)
        }
        print("qInOrder: \(qInOrder)")

        return pInOrder == qInOrder
    }

    public func inorder(_ tree: TreeNode, _ order: inout [Int]) {
        order.append(tree.val)

        if tree.left != nil {
            inorder(tree.left!, &order)
        }
        else {
            order.append(Int.max)
        }

        if tree.right != nil {
            inorder(tree.right!, &order)
        }
        else {
            order.append(Int.max)
        }
    }
}

/** Test code
let t = TreeNode(1)
t.left = TreeNode(2)
//t.right = TreeNode(3)

let u = TreeNode(1)
u.left = TreeNode(2)
// u.right = TreeNode(3)

let s = Solution()
// var order = [Int]()
// s.inorder(t, &order)
// print(order)

let result = s.isSameTree(t, u)
print(result)
*/
