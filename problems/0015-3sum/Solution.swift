class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        let a = nums.sorted()
        let n = a.count
        var res = [[Int]]()

        for i in 0..<n - 2 {
            if i > 0 && a[i] == a[i - 1] { continue }
            var l = i + 1, r = n - 1
            while l < r {
                let sum = a[i] + a[l] + a[r]
                if sum < 0 {
                    l += 1
                } else if sum > 0 {
                    r -= 1
                } else {
                    res.append([a[i], a[l], a[r]])
                    l += 1
                    r -= 1
                    // nhảy qua các số trùng để không ra bộ ba lặp
                    while l < r && a[l] == a[l - 1] { l += 1 }
                }
            }
        }
        return res
    }
}
