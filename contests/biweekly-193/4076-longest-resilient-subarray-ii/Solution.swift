class Solution {
    func gcd(_ a: Int, _ b: Int) -> Int {
        return b == 0 ? a : gcd(b, a % b)
    }

    func resilientSubarray(_ nums: [Int], _ k: Int) -> Int {
        let n = nums.count
        var best = 1
        var i = 0

        while i < n {
            // đoạn dài nhất [i, j) có cùng số dư r
            let r = nums[i] % k
            var j = i
            while j < n && nums[j] % k == r { j += 1 }
            let m = j - i

            // cần (L - 1) * r chia hết cho k  <=>  L - 1 là bội của g
            let g = k / gcd(r, k)
            best = max(best, 1 + (m - 1) / g * g)

            i = j
        }
        return best
    }
}
