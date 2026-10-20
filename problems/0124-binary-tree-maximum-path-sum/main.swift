// Định nghĩa do LeetCode cung cấp sẵn
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) { self.val = val; self.left = left; self.right = right }
}

// dựng cây từ mảng theo tầng kiểu LeetCode, nil là không có nút
func tree(_ a: [Int?]) -> TreeNode? {
    guard let f = a.first, let v = f else { return nil }
    let root = TreeNode(v)
    var q = [root], i = 1, h = 0
    while i < a.count {
        let n = q[h]; h += 1
        if let x = a[i] { n.left = TreeNode(x); q.append(n.left!) }
        i += 1
        if i < a.count, let x = a[i] { n.right = TreeNode(x); q.append(n.right!) }
        i += 1
    }
    return root
}

// đọc cây ra mảng theo tầng (bỏ các nil thừa ở cuối)
func level(_ r: TreeNode?) -> [Int?] {
    var out = [Int?](), q: [TreeNode?] = [r], h = 0
    while h < q.count {
        let n = q[h]; h += 1
        out.append(n?.val)
        if let n = n { q.append(n.left); q.append(n.right) }
    }
    while let l = out.last, l == nil { out.removeLast() }
    return out
}

func randomTree(_ n: Int, _ lo: Int, _ hi: Int) -> TreeNode? {
    if n == 0 { return nil }
    let l = Int.random(in: 0..<n)
    return TreeNode(Int.random(in: lo...hi), randomTree(l, lo, hi), randomTree(n - 1 - l, lo, hi))
}

// vét cạn: thử mọi cặp nút làm hai đầu đường đi
func brute(_ root: TreeNode?) -> Int {
    var nodes = [TreeNode](), parent = [ObjectIdentifier: TreeNode]()
    func walk(_ n: TreeNode?) { guard let n = n else { return }; nodes.append(n)
        if let l = n.left { parent[ObjectIdentifier(l)] = n }; if let r = n.right { parent[ObjectIdentifier(r)] = n }
        walk(n.left); walk(n.right) }
    walk(root)
    func up(_ n: TreeNode) -> [TreeNode] { var out = [n], c = n; while let p = parent[ObjectIdentifier(c)] { out.append(p); c = p }; return out }
    var best = Int.min
    for a in nodes { for b in nodes {
        let pa = up(a), pb = up(b)
        let common = pa.first { x in pb.contains { $0 === x } }!
        var s = 0
        for x in pa { s += x.val; if x === common { break } }
        for x in pb { if x === common { break }; s += x.val }
        best = max(best, s)
    } }
    return best
}

precondition(Solution().maxPathSum(tree([1, 2, 3])) == 6)
precondition(Solution().maxPathSum(tree([-10, 9, 20, nil, nil, 15, 7])) == 42)
precondition(Solution().maxPathSum(tree([-3])) == -3)
precondition(Solution().maxPathSum(tree([2, -1])) == 2)
for _ in 0..<1500 {
    let t = randomTree(Int.random(in: 1...8), -6, 6)
    precondition(Solution().maxPathSum(t) == brute(t), "\(level(t))")
}
print("OK")
