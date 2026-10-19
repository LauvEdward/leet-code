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

// tạo danh sách, nối đuôi về nút thứ pos (pos = -1: không có chu trình)
func cyc(_ a: [Int], _ pos: Int) -> ListNode? {
    let nodes = a.map { ListNode($0) }
    for i in 0..<max(nodes.count - 1, 0) { nodes[i].next = nodes[i + 1] }
    if pos >= 0 { nodes[nodes.count - 1].next = nodes[pos] }
    return nodes.first
}

precondition(Solution().hasCycle(cyc([3, 2, 0, -4], 1)) == true)
precondition(Solution().hasCycle(cyc([1, 2], 0)) == true)
precondition(Solution().hasCycle(cyc([1], -1)) == false)
precondition(Solution().hasCycle(cyc([1], 0)) == true)
precondition(Solution().hasCycle(nil) == false)
for n in 1...12 { for pos in -1..<n { precondition(Solution().hasCycle(cyc(Array(0..<n), pos)) == (pos >= 0)) } }
print("OK")
