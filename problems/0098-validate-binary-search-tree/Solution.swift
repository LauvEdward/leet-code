class Solution {
    func isValidBST(_ root: TreeNode?) -> Bool {
        return check(root, Int.min, Int.max)
    }

    // mọi nút trong cây con phải nằm chặt trong (lo, hi)
    func check(_ node: TreeNode?, _ lo: Int, _ hi: Int) -> Bool {
        guard let n = node else { return true }
        if n.val <= lo || n.val >= hi { return false }
        return check(n.left, lo, n.val) && check(n.right, n.val, hi)
    }
}
