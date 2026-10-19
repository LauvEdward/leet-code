// Định nghĩa do LeetCode cung cấp sẵn
public class Node {
    public var val: Int
    public var next: Node?
    public var random: Node?
    public init(_ val: Int) { self.val = val; self.next = nil; self.random = nil }
}

// dựng danh sách từ [[val, randomIndex]] (randomIndex = -1 là nil)
func build(_ a: [[Int]]) -> Node? {
    let ns = a.map { Node($0[0]) }
    for i in 0..<ns.count {
        if i + 1 < ns.count { ns[i].next = ns[i + 1] }
        if a[i][1] >= 0 { ns[i].random = ns[a[i][1]] }
    }
    return ns.first
}

func check(_ a: [[Int]], line: UInt = #line) {
    let orig = build(a)
    let copy = Solution().copyRandomList(orig)
    var olds = [Node](), news = [Node]()
    var p = orig; while let x = p { olds.append(x); p = x.next }
    var q = copy; while let x = q { news.append(x); q = x.next }
    precondition(olds.count == news.count, "line \(line)")
    for i in 0..<news.count {
        precondition(news[i] !== olds[i], "line \(line): không được dùng lại nút cũ")
        precondition(news[i].val == a[i][0])
        if a[i][1] < 0 { precondition(news[i].random == nil) } else { precondition(news[i].random === news[a[i][1]]) }
    }
}

check([[7, -1], [13, 0], [11, 4], [10, 2], [1, 0]])
check([[1, 1], [2, 1]])
check([[3, -1], [3, 0], [3, -1]])
check([])
check([[5, 0]])
for _ in 0..<500 {
    let n = Int.random(in: 0...8)
    check((0..<n).map { _ in [Int.random(in: -9...9), Int.random(in: -1..<n)] })
}
print("OK")
