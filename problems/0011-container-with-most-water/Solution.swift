class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var l = 0, r = height.count - 1, best = 0
        while l < r {
            best = max(best, min(height[l], height[r]) * (r - l))
            // bỏ cột thấp hơn, giữ nó cũng không thể tốt hơn
            if height[l] < height[r] { l += 1 } else { r -= 1 }
        }
        return best
    }
}
