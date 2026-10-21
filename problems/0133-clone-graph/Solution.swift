class Solution {
    var copies = [ObjectIdentifier: Node]()   // nút cũ -> bản sao

    func cloneGraph(_ node: Node?) -> Node? {
        guard let n = node else { return nil }
        if let c = copies[ObjectIdentifier(n)] { return c }

        let c = Node(n.val)
        copies[ObjectIdentifier(n)] = c   // ghi trước khi đệ quy để không lặp vô hạn
        for nb in n.neighbors {
            c.neighbors.append(cloneGraph(nb))
        }
        return c
    }
}
