class Solution {
    func copyRandomList(_ head: Node?) -> Node? {
        // nút cũ -> nút mới
        var m = [ObjectIdentifier: Node]()

        var p = head
        while let x = p {
            m[ObjectIdentifier(x)] = Node(x.val)
            p = x.next
        }

        p = head
        while let x = p {
            let c = m[ObjectIdentifier(x)]!
            if let nx = x.next { c.next = m[ObjectIdentifier(nx)] }
            if let r = x.random { c.random = m[ObjectIdentifier(r)] }
            p = x.next
        }
        return head == nil ? nil : m[ObjectIdentifier(head!)]
    }
}
