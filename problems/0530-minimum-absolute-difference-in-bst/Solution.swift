class Solution {
    var prev: Int? = nil
    var best = Int.max

    func getMinimumDifference(_ root: TreeNode?) -> Int {
        prev = nil
        best = Int.max
        inorder(root)
        return best
    }

    // duyệt trung thứ tự BST cho dãy tăng, chỉ cần so hai số liền nhau
    func inorder(_ node: TreeNode?) {
        guard let n = node else { return }
        inorder(n.left)
        if let p = prev { best = min(best, n.val - p) }
        prev = n.val
        inorder(n.right)
    }
}
