// Định nghĩa do LeetCode cung cấp sẵn
public class Node {
    public var val: Int
    public var left: Node?
    public var right: Node?
    public var next: Node?
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; self.next = nil }
}

func tree(_ a: [Int?]) -> Node? {
    guard let f = a.first, let v = f else { return nil }
    let root = Node(v)
    var q = [root], i = 1, h = 0
    while i < a.count {
        let n = q[h]; h += 1
        if let x = a[i] { n.left = Node(x); q.append(n.left!) }
        i += 1
        if i < a.count, let x = a[i] { n.right = Node(x); q.append(n.right!) }
        i += 1
    }
    return root
}

// đọc theo con trỏ next: mỗi tầng đi từ nút trái nhất, '#' đánh dấu hết tầng
func serialize(_ r: Node?) -> [String] {
    var out = [String](), first = r
    while let f = first {
        var p: Node? = f, nextFirst: Node? = nil
        while let x = p {
            out.append(String(x.val))
            if nextFirst == nil { nextFirst = x.left ?? x.right }
            p = x.next
        }
        out.append("#")
        // tìm nút đầu tầng sau (có thể nằm dưới nút không phải nút đầu)
        var q: Node? = f
        nextFirst = nil
        while let x = q, nextFirst == nil { nextFirst = x.left ?? x.right; q = x.next }
        first = nextFirst
    }
    return out
}

precondition(serialize(Solution().connect(tree([1, 2, 3, 4, 5, nil, 7]))) == ["1", "#", "2", "3", "#", "4", "5", "7", "#"])
precondition(serialize(Solution().connect(tree([]))) == [])
precondition(serialize(Solution().connect(tree([1, 2, 3, 4, nil, nil, 5]))) == ["1", "#", "2", "3", "#", "4", "5", "#"])
precondition(serialize(Solution().connect(tree([1, 2, nil, 3, nil, 4]))) == ["1", "#", "2", "#", "3", "#", "4", "#"])
print("OK")
