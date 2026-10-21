class Solution {
    func averageOfLevels(_ root: TreeNode?) -> [Double] {
        var res = [Double]()
        var cur = [TreeNode]()
        if let r = root { cur.append(r) }
        while !cur.isEmpty {
            var sum = 0
            var nxt = [TreeNode]()
            for n in cur {
                sum += n.val
                if let l = n.left { nxt.append(l) }
                if let r = n.right { nxt.append(r) }
            }
            res.append(Double(sum) / Double(cur.count))
            cur = nxt
        }
        return res
    }
}
