class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        let a = Array(s)
        var last = [Character: Int]()
        var start = 0, best = 0

        for i in 0..<a.count {
            if let j = last[a[i]], j >= start {
                start = j + 1
            }
            last[a[i]] = i
            best = max(best, i - start + 1)
        }
        return best
    }
}
