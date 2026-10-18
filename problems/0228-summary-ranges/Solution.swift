class Solution {
    func summaryRanges(_ nums: [Int]) -> [String] {
        var res = [String]()
        var i = 0
        while i < nums.count {
            var j = i
            while j + 1 < nums.count && nums[j + 1] == nums[j] + 1 { j += 1 }
            res.append(i == j ? String(nums[i]) : String(nums[i]) + "->" + String(nums[j]))
            i = j + 1
        }
        return res
    }
}
