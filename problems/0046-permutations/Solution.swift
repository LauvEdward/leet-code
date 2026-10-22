class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]]()
        var cur = [Int]()
        var used = [Bool](repeating: false, count: nums.count)

        func go() {
            if cur.count == nums.count {
                res.append(cur)
                return
            }
            for i in 0..<nums.count where !used[i] {
                used[i] = true
                cur.append(nums[i])
                go()
                cur.removeLast()
                used[i] = false
            }
        }
        go()
        return res
    }
}
