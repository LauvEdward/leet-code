class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var k = 0
        for x in nums {
            // giữ x nếu nó chưa xuất hiện đủ 2 lần ở phần đã giữ
            if k < 2 || x != nums[k - 2] {
                nums[k] = x
                k += 1
            }
        }
        return k
    }
}
