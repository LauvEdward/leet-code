class Solution {
    func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
        var l = 0, sum = 0, best = Int.max
        for r in 0..<nums.count {
            sum += nums[r]
            // đủ rồi thì co bên trái hết mức
            while sum >= target {
                best = min(best, r - l + 1)
                sum -= nums[l]
                l += 1
            }
        }
        return best == Int.max ? 0 : best
    }
}
