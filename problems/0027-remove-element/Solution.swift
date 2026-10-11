class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var k = 0
        for x in nums where x != val {
            nums[k] = x
            k += 1
        }
        return k
    }
}
