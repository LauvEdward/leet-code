class Solution {
    func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
        let dummy = ListNode(0, head)
        var prev = dummy
        for _ in 1..<left { prev = prev.next! }

        // lần lượt nhấc nút ngay sau cur lên đầu đoạn
        let cur = prev.next!
        for _ in 0..<(right - left) {
            let x = cur.next!
            cur.next = x.next
            x.next = prev.next
            prev.next = x
        }
        return dummy.next
    }
}
