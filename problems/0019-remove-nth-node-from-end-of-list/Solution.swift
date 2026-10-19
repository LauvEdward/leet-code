class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        let dummy = ListNode(0, head)
        var fast: ListNode? = dummy, slow = dummy

        // fast đi trước n + 1 bước để khoảng cách giữa hai con trỏ là n + 1
        for _ in 0...n { fast = fast?.next }
        while fast != nil {
            fast = fast?.next
            slow = slow.next!
        }
        // slow đứng ngay trước nút cần xóa
        slow.next = slow.next?.next
        return dummy.next
    }
}
