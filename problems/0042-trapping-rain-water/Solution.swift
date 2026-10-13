class Solution {
    func trap(_ height: [Int]) -> Int {
        var l = 0, r = height.count - 1
        var lmax = 0, rmax = 0, res = 0

        while l < r {
            // bên thấp hơn quyết định mực nước
            if height[l] < height[r] {
                lmax = max(lmax, height[l])
                res += lmax - height[l]
                l += 1
            } else {
                rmax = max(rmax, height[r])
                res += rmax - height[r]
                r -= 1
            }
        }
        return res
    }
}
