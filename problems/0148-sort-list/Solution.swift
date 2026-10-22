class Solution {
    func sortList(_ head: ListNode?) -> ListNode? {
        guard let h = head, h.next != nil else { return head }

        // tách đôi: slow dừng ở cuối nửa đầu
        var slow = h, fast = h.next
        while let f = fast, let ff = f.next {
            slow = slow.next!
            fast = ff.next
        }
        let second = slow.next
        slow.next = nil

        return merge(sortList(h), sortList(second))
    }

    // trộn hai danh sách đã sắp (như bài 21)
    func merge(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let dummy = ListNode()
        var t = dummy
        var a = l1, b = l2
        while let x = a, let y = b {
            if x.val <= y.val {
                t.next = x
                a = x.next
            } else {
                t.next = y
                b = y.next
            }
            t = t.next!
        }
        t.next = a ?? b
        return dummy.next
    }
}
