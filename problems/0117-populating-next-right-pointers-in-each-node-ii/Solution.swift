class Solution {
    func connect(_ root: Node?) -> Node? {
        // duyệt theo tầng, nối các nút cùng tầng từ trái sang phải
        var cur = [Node]()
        if let r = root { cur.append(r) }
        while !cur.isEmpty {
            var nxt = [Node]()
            for i in 0..<cur.count {
                cur[i].next = i + 1 < cur.count ? cur[i + 1] : nil
                if let l = cur[i].left { nxt.append(l) }
                if let r = cur[i].right { nxt.append(r) }
            }
            cur = nxt
        }
        return root
    }
}
