class Solution {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        return mirror(root?.left, root?.right)
    }

    // a và b có phải ảnh gương của nhau không
    func mirror(_ a: TreeNode?, _ b: TreeNode?) -> Bool {
        if a == nil && b == nil { return true }
        guard let x = a, let y = b else { return false }
        return x.val == y.val && mirror(x.left, y.right) && mirror(x.right, y.left)
    }
}
