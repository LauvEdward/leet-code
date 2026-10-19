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

func check(_ a: [Int], line: UInt = #line) {
    let got = array(Solution().deleteDuplicates(list(a)))
    let want = a.filter { x in a.filter { $0 == x }.count == 1 }
    precondition(got == want, "line \(line): \(a): got \(got), want \(want)")
}

precondition(array(Solution().deleteDuplicates(list([1, 2, 3, 3, 4, 4, 5]))) == [1, 2, 5])
precondition(array(Solution().deleteDuplicates(list([1, 1, 1, 2, 3]))) == [2, 3])
check([])
check([1, 1])
check([1, 2, 2])
for _ in 0..<3000 {
    check((0..<Int.random(in: 0...10)).map { _ in Int.random(in: 0...4) }.sorted())
}
print("OK")
