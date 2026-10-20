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

func check(_ a: [Int], _ k: Int, line: UInt = #line) {
    let got = array(Solution().rotateRight(list(a), k))
    var want = a
    if !a.isEmpty { for _ in 0..<(k % a.count) { want.insert(want.removeLast(), at: 0) } }
    precondition(got == want, "line \(line): \(a) k=\(k): got \(got), want \(want)")
}

precondition(array(Solution().rotateRight(list([1, 2, 3, 4, 5]), 2)) == [4, 5, 1, 2, 3])
precondition(array(Solution().rotateRight(list([0, 1, 2]), 4)) == [2, 0, 1])
check([], 3)
check([1], 100)
for n in 1...7 { for k in 0...15 { check(Array(1...n), k) } }
check([1, 2], 2_000_000_000)
print("OK")
