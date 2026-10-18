class Solution {
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        var last = [Int: Int]()   // giá trị -> vị trí gần nhất
        for (i, x) in nums.enumerated() {
            if let j = last[x], i - j <= k { return true }
            last[x] = i
        }
        return false
    }
}
