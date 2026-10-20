class Solution {
    var best = Int.min

    func maxPathSum(_ root: TreeNode?) -> Int {
        best = Int.min
        _ = gain(root)
        return best
    }

    // tổng lớn nhất của đường đi xuống bắt đầu tại node (âm thì không lấy nhánh)
    func gain(_ node: TreeNode?) -> Int {
        guard let n = node else { return 0 }
        let l = max(0, gain(n.left))
        let r = max(0, gain(n.right))
        // đường đi "gập" tại n: trái + n + phải
        best = max(best, n.val + l + r)
        return n.val + max(l, r)
    }
}
