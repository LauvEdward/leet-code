class Solution {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        if root == nil || root === p || root === q { return root }
        let l = lowestCommonAncestor(root?.left, p, q)
        let r = lowestCommonAncestor(root?.right, p, q)
        // mỗi bên tìm thấy một nút → root là tổ tiên chung thấp nhất
        if l != nil && r != nil { return root }
        return l ?? r
    }
}
