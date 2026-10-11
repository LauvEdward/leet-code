class Solution {
    func jump(_ nums: [Int]) -> Int {
        var jumps = 0, end = 0, far = 0
        for i in 0..<nums.count - 1 {
            far = max(far, i + nums[i])
            if i == end {
                jumps += 1
                end = far
            }
        }
        return jumps
    }
}
