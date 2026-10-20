class Solution {
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil && q == nil { return true }
        guard let a = p, let b = q else { return false }
        return a.val == b.val && isSameTree(a.left, b.left) && isSameTree(a.right, b.right)
    }
}
