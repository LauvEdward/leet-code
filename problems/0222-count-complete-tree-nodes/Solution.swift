class Solution {
    func countNodes(_ root: TreeNode?) -> Int {
        guard let r = root else { return 0 }

        // độ cao đo theo mép trái và mép phải
        var lh = 0, rh = 0
        var a: TreeNode? = r, b: TreeNode? = r
        while let x = a { lh += 1; a = x.left }
        while let x = b { rh += 1; b = x.right }

        // bằng nhau → cây đầy đủ hoàn hảo
        if lh == rh { return (1 << lh) - 1 }
        return 1 + countNodes(r.left) + countNodes(r.right)
    }
}
