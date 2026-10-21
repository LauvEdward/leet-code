class Solution {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        var res = [[Int]]()
        var cur = [TreeNode]()
        if let r = root { cur.append(r) }
        while !cur.isEmpty {
            res.append(cur.map { $0.val })
            var nxt = [TreeNode]()
            for n in cur {
                if let l = n.left { nxt.append(l) }
                if let r = n.right { nxt.append(r) }
            }
            cur = nxt
        }
        return res
    }
}
