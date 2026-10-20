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

func insert(_ r: TreeNode?, _ v: Int) -> TreeNode {
    guard let r = r else { return TreeNode(v) }
    if v < r.val { r.left = insert(r.left, v) } else { r.right = insert(r.right, v) }
    return r
}

let it = BSTIterator(tree([7, 3, 15, nil, nil, 9, 20]))
var out = [Int]()
while it.hasNext() { out.append(it.next()) }
precondition(out == [3, 7, 9, 15, 20])

for _ in 0..<1000 {
    let vals = Array(Set((0..<Int.random(in: 1...15)).map { _ in Int.random(in: 0...50) })).shuffled()
    var r: TreeNode? = nil
    for v in vals { r = insert(r, v) }
    let it = BSTIterator(r)
    var got = [Int]()
    while it.hasNext() { got.append(it.next()) }
    precondition(got == vals.sorted())
}
print("OK")
