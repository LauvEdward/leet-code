class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        let set = Set(nums)
        var best = 0
        for x in set where !set.contains(x - 1) {
            // x là đầu một dãy, đếm tới hết dãy
            var len = 1
            while set.contains(x + len) { len += 1 }
            best = max(best, len)
        }
        return best
    }
}
