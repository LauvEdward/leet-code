class Solution {
    func maxProductPair(_ nums: [Int], _ target: Int) -> [Int] {
        var res = [-1, -1]
        var best = Int.min

        for i in 0..<nums.count {
            for j in 0..<nums.count {
                if nums[i] + nums[j] == target && nums[i] > nums[j] && nums[i] * nums[j] > best {
                    best = nums[i] * nums[j]
                    res = [i, j]
                }
            }
        }
        return res
    }
}
