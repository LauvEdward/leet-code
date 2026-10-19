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

func check(_ a: [Int], _ l: Int, _ r: Int, line: UInt = #line) {
    let got = array(Solution().reverseBetween(list(a), l, r))
    let want = Array(a[..<(l - 1)]) + a[(l - 1)..<r].reversed() + Array(a[r...])
    precondition(got == want, "line \(line): got \(got), want \(want)")
}

check([1, 2, 3, 4, 5], 2, 4)
check([5], 1, 1)
check([3, 5], 1, 2)
for n in 1...8 { for l in 1...n { for r in l...n { check(Array(1...n), l, r) } } }
print("OK")
