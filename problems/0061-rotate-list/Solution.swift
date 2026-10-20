class Solution {
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        guard let head = head else { return nil }

        // đếm độ dài và tìm đuôi
        var n = 1, tail = head
        while let nx = tail.next {
            tail = nx
            n += 1
        }

        // nối thành vòng rồi cắt ở chỗ mới
        tail.next = head
        var newTail = head
        for _ in 0..<(n - k % n - 1) { newTail = newTail.next! }
        let newHead = newTail.next
        newTail.next = nil
        return newHead
    }
}
