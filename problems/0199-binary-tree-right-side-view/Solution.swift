class Solution {
    func rightSideView(_ root: TreeNode?) -> [Int] {
        var res = [Int]()
        var cur = [TreeNode]()
        if let r = root { cur.append(r) }
        while !cur.isEmpty {
            res.append(cur.last!.val)   // nút phải nhất của tầng
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
