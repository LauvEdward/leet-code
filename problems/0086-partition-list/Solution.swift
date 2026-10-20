class Solution {
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        // hai danh sách: nhỏ hơn x và còn lại, giữ thứ tự gốc
        let small = ListNode(), big = ListNode()
        var s = small, b = big
        var p = head
        while let c = p {
            if c.val < x {
                s.next = c
                s = c
            } else {
                b.next = c
                b = c
            }
            p = c.next
        }
        b.next = nil   // cắt đuôi cũ, không thì có thể thành vòng
        s.next = big.next
        return small.next
    }
}
