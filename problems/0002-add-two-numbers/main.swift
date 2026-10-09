// Định nghĩa do LeetCode cung cấp sẵn
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil }
    public init(_ val: Int) { self.val = val; self.next = nil }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next }
}

func list(_ values: [Int]) -> ListNode? {
    let dummy = ListNode()
    var tail = dummy
    for v in values {
        tail.next = ListNode(v)
        tail = tail.next!
    }
    return dummy.next
}

func array(_ head: ListNode?) -> [Int] {
    var out = [Int](), node = head
    while let n = node {
        out.append(n.val)
        node = n.next
    }
    return out
}

func check(_ a: [Int], _ b: [Int], _ want: [Int], line: UInt = #line) {
    let got = array(Solution().addTwoNumbers(list(a), list(b)))
    precondition(got == want, "line \(line): got \(got), want \(want)")
}

check([2, 4, 3], [5, 6, 4], [7, 0, 8])
check([0], [0], [0])
check([9, 9, 9, 9, 9, 9, 9], [9, 9, 9, 9], [8, 9, 9, 9, 0, 0, 0, 1])
check([5], [5], [0, 1])
check([1], [9, 9], [0, 0, 1])
print("OK")
