class Solution {
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        let dummy = ListNode(0, head)
        var prev = dummy

        while true {
            // còn đủ k nút không?
            var check = prev.next
            for _ in 0..<k {
                if check == nil { return dummy.next }
                check = check?.next
            }

            // đảo k nút sau prev bằng cách nhấc dần lên đầu (như bài 92)
            let first = prev.next!
            for _ in 0..<(k - 1) {
                let x = first.next!
                first.next = x.next
                x.next = prev.next
                prev.next = x
            }
            prev = first   // first giờ là nút cuối của nhóm
        }
    }
}
