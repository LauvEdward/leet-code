class Solution {
    func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        guard let r = root else { return false }
        let rest = targetSum - r.val
        if r.left == nil && r.right == nil { return rest == 0 }
        return hasPathSum(r.left, rest) || hasPathSum(r.right, rest)
    }
}
