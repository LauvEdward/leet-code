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
func height(_ r: TreeNode?) -> Int? {   // nil nếu không cân bằng
    guard let r = r else { return 0 }
    guard let l = height(r.left), let h = height(r.right), abs(l - h) <= 1 else { return nil }
    return 1 + max(l, h)
}

precondition(level(Solution().sortedArrayToBST([-10, -3, 0, 5, 9])) == [0, -10, 5, nil, -3, nil, 9])
precondition(level(Solution().sortedArrayToBST([1, 3])) == [1, nil, 3])
for n in 1...64 {
    let a = Array(0..<n).map { $0 * 3 - 50 }
    let t = Solution().sortedArrayToBST(a)
    precondition(inorder(t) == a && height(t) != nil)
}
print("OK")
