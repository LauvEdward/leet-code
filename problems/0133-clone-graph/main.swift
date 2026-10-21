// Định nghĩa do LeetCode cung cấp sẵn
public class Node {
    public var val: Int
    public var neighbors: [Node?]
    public init(_ val: Int) { self.val = val; self.neighbors = [] }
}

// danh sách kề kiểu LeetCode: adj[i] là hàng xóm của nút i + 1
func build(_ adj: [[Int]]) -> Node? {
    if adj.isEmpty { return nil }
    let ns = (1...adj.count).map { Node($0) }
    for (i, nb) in adj.enumerated() { ns[i].neighbors = nb.map { ns[$0 - 1] } }
    return ns[0]
}

func check(_ adj: [[Int]], line: UInt = #line) {
    let orig = build(adj)
    let copy = Solution().cloneGraph(orig)
    if adj.isEmpty { precondition(copy == nil); return }
    // BFS song song trên hai đồ thị
    var seen = [ObjectIdentifier: Node](), q = [(orig!, copy!)]
    while let (a, b) = q.popLast() {
        if seen[ObjectIdentifier(a)] != nil { precondition(seen[ObjectIdentifier(a)]! === b, "line \(line)"); continue }
        seen[ObjectIdentifier(a)] = b
        precondition(a !== b && a.val == b.val && a.neighbors.count == b.neighbors.count, "line \(line)")
        for (x, y) in zip(a.neighbors, b.neighbors) {
            precondition(x!.val == y!.val)
            q.append((x!, y!))
        }
    }
    precondition(seen.count == adj.count, "line \(line)")
}

check([[2, 4], [1, 3], [2, 4], [1, 3]])
check([[]])
check([])
check([[2], [1]])
check([[2, 3], [1, 3], [1, 2]])
print("OK")
