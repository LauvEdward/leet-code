class Solution {
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard let r = root else { return nil }
        let l = invertTree(r.left)
        r.left = invertTree(r.right)
        r.right = l
        return r
    }
}
