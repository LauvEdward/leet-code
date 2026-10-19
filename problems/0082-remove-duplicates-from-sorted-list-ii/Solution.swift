class Solution {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        let dummy = ListNode(0, head)
        var prev = dummy
        var cur = head

        while let c = cur {
            if let nx = c.next, nx.val == c.val {
                // bỏ cả cụm giá trị này
                var p: ListNode? = c
                while let q = p, q.val == c.val { p = q.next }
                prev.next = p
                cur = p
            } else {
                prev = c
                cur = c.next
            }
        }
        return dummy.next
    }
}
