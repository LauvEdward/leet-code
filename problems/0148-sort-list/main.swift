// Định nghĩa do LeetCode cung cấp sẵn
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil }
    public init(_ val: Int) { self.val = val; self.next = nil }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next }
}

func list(_ a: [Int]) -> ListNode? {
    let d = ListNode()
    var t = d
    for v in a { t.next = ListNode(v); t = t.next! }
    return d.next
}

func array(_ h: ListNode?) -> [Int] {
    var out = [Int](), n = h
    while let x = n { out.append(x.val); n = x.next }
    return out
}
precondition(array(Solution().sortList(list([4, 2, 1, 3]))) == [1, 2, 3, 4])
precondition(array(Solution().sortList(list([-1, 5, 3, 4, 0]))) == [-1, 0, 3, 4, 5])
precondition(array(Solution().sortList(list([]))) == [])
for _ in 0..<2000 {
    let a = (0..<Int.random(in: 0...20)).map { _ in Int.random(in: -10...10) }
    precondition(array(Solution().sortList(list(a))) == a.sorted())
}
let big = (0..<50_000).map { _ in Int.random(in: -100_000...100_000) }
precondition(array(Solution().sortList(list(big))) == big.sorted())
print("OK")
