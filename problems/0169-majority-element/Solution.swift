class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        var cand = 0, cnt = 0
        for x in nums {
            if cnt == 0 { cand = x }
            cnt += x == cand ? 1 : -1
        }
        return cand
    }
}
