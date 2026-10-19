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

func check(_ a: [Int], _ n: Int, line: UInt = #line) {
    let got = array(Solution().removeNthFromEnd(list(a), n))
    var want = a
    want.remove(at: a.count - n)
    precondition(got == want, "line \(line): got \(got), want \(want)")
}

precondition(array(Solution().removeNthFromEnd(list([1, 2, 3, 4, 5]), 2)) == [1, 2, 3, 5])
precondition(array(Solution().removeNthFromEnd(list([1]), 1)) == [])
precondition(array(Solution().removeNthFromEnd(list([1, 2]), 1)) == [1])
for len in 1...10 { for n in 1...len { check(Array(1...len), n) } }
print("OK")
