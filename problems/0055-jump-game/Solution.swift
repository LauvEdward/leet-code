class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        var far = 0
        for i in 0..<nums.count {
            if i > far { return false }
            far = max(far, i + nums[i])
        }
        return true
    }
}
