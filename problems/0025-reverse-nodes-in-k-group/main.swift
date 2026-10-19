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
    let got = array(Solution().reverseKGroup(list(a), k))
    var want = [Int](), i = 0
    while i + k <= a.count { want += a[i..<i + k].reversed(); i += k }
    want += a[i...]
    precondition(got == want, "line \(line): \(a) k=\(k): got \(got), want \(want)")
}

precondition(array(Solution().reverseKGroup(list([1, 2, 3, 4, 5]), 2)) == [2, 1, 4, 3, 5])
precondition(array(Solution().reverseKGroup(list([1, 2, 3, 4, 5]), 3)) == [3, 2, 1, 4, 5])
for n in 1...12 { for k in 1...n { check(Array(1...n), k) } }
print("OK")
