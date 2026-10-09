class Solution {
    func longestSubarray(_ nums: [Int], _ k: Int) -> Int {
        let n = nums.count
        // seen[v] == l nghĩa là trong đoạn bắt đầu từ l đã có phần tử x với 2x % k == v
        var seen = [Int](repeating: -1, count: k)
        var best = 0

        for l in 0..<n {
            var sum = 0
            for r in l..<n {
                sum = ((sum + nums[r]) % k + k) % k
                seen[((2 * nums[r]) % k + k) % k] = l

                // chia hết sẵn, hoặc đổi dấu 1 phần tử x: sum - 2x chia hết
                if sum == 0 || seen[sum] == l {
                    best = max(best, r - l + 1)
                }
            }
        }
        return best
    }
}
