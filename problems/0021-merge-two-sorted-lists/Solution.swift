class Solution {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        let dummy = ListNode()
        var t = dummy
        var a = list1, b = list2
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
        t.next = a ?? b   // nối phần còn lại
        return dummy.next
    }
}
