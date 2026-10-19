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

func check(_ a: [Int], _ b: [Int], line: UInt = #line) {
    let got = array(Solution().mergeTwoLists(list(a), list(b)))
    precondition(got == (a + b).sorted(), "line \(line): got \(got)")
}

check([1, 2, 4], [1, 3, 4])
check([], [])
check([], [0])
check([5], [1, 2, 3])
for _ in 0..<2000 {
    check((0..<Int.random(in: 0...6)).map { _ in Int.random(in: -5...5) }.sorted(),
          (0..<Int.random(in: 0...6)).map { _ in Int.random(in: -5...5) }.sorted())
}
print("OK")
