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
func inorder(_ r: TreeNode?) -> [Int] { guard let r = r else { return [] }; return inorder(r.left) + [r.val] + inorder(r.right) }

precondition(Solution().isValidBST(tree([2, 1, 3])))
precondition(!Solution().isValidBST(tree([5, 1, 4, nil, nil, 3, 6])))
precondition(!Solution().isValidBST(tree([5, 4, 6, nil, nil, 3, 7])))   // 3 nằm bên phải 5
precondition(!Solution().isValidBST(tree([2, 2, 2])))
precondition(Solution().isValidBST(tree([-2147483648, nil, 2147483647])))
for _ in 0..<3000 {
    let t = randomTree(Int.random(in: 1...8), 0, 9)
    let s = inorder(t)
    precondition(Solution().isValidBST(t) == zip(s, s.dropFirst()).allSatisfy { $0 < $1 })
}
print("OK")
