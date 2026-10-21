class Solution {
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        var res = [[Int]]()
        var cur = [TreeNode]()
        if let r = root { cur.append(r) }
        while !cur.isEmpty {
            let vals = cur.map { $0.val }
            // tầng lẻ (đếm từ 0) đọc từ phải sang trái
            res.append(res.count % 2 == 0 ? vals : vals.reversed())
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
