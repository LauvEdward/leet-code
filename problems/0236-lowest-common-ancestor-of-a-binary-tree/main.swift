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
func nodes(_ r: TreeNode?) -> [TreeNode] { guard let r = r else { return [] }; return [r] + nodes(r.left) + nodes(r.right) }
func path(_ r: TreeNode?, _ x: TreeNode) -> [TreeNode]? {
    guard let r = r else { return nil }
    if r === x { return [r] }
    if let p = path(r.left, x) ?? path(r.right, x) { return [r] + p }
    return nil
}
func brute(_ root: TreeNode?, _ p: TreeNode, _ q: TreeNode) -> TreeNode {
    let a = path(root, p)!, b = path(root, q)!
    var i = 0
    while i + 1 < min(a.count, b.count) && a[i + 1] === b[i + 1] { i += 1 }
    return a[i]
}

let t = tree([3, 5, 1, 6, 2, 0, 8, nil, nil, 7, 4])
let all = nodes(t)
func find(_ v: Int) -> TreeNode { all.first { $0.val == v }! }
precondition(Solution().lowestCommonAncestor(t, find(5), find(1))!.val == 3)
precondition(Solution().lowestCommonAncestor(t, find(5), find(4))!.val == 5)
for _ in 0..<1000 {
    let r = randomTree(Int.random(in: 2...12), 0, 9)
    let ns = nodes(r)
    let p = ns.randomElement()!, q = ns.randomElement()!
    precondition(Solution().lowestCommonAncestor(r, p, q) === brute(r, p, q))
}
print("OK")
