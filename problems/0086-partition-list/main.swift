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

func check(_ a: [Int], _ x: Int, line: UInt = #line) {
    let got = array(Solution().partition(list(a), x))
    let want = a.filter { $0 < x } + a.filter { $0 >= x }
    precondition(got == want, "line \(line): got \(got), want \(want)")
}

precondition(array(Solution().partition(list([1, 4, 3, 2, 5, 2]), 3)) == [1, 2, 2, 4, 3, 5])
precondition(array(Solution().partition(list([2, 1]), 2)) == [1, 2])
check([], 0)
check([5, 6], 1)
check([1, 2], 9)
for _ in 0..<3000 {
    check((0..<Int.random(in: 0...8)).map { _ in Int.random(in: -3...6) }, Int.random(in: -3...6))
}
print("OK")
