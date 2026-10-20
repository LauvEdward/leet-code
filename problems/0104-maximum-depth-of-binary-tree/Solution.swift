class Solution {
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let r = root else { return 0 }
        return 1 + max(maxDepth(r.left), maxDepth(r.right))
    }
}
