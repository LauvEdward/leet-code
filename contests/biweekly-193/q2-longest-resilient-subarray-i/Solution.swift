class Solution {
    func resilientSubarray(_ nums: [Int], _ k: Int) -> Int {
        let n = nums.count
        var best = 1

        for l in 0..<n {
            let r0 = nums[l] % k
            var len = 0
            // mọi phần tử trong đoạn phải cùng số dư r0
            for r in l..<n {
                if nums[r] % k != r0 { break }
                len += 1
                // tổng ≡ len * r0, bỏ 1 phần tử còn (len - 1) * r0
                if (len - 1) * r0 % k == 0 {
                    best = max(best, len)
                }
            }
        }
        return best
    }
}
