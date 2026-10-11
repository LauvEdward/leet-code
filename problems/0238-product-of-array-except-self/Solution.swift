class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        let n = nums.count
        var res = [Int](repeating: 1, count: n)

        // res[i] = tích các số bên trái i
        for i in 1..<n {
            res[i] = res[i - 1] * nums[i - 1]
        }
        // nhân thêm tích các số bên phải i
        var right = 1
        for i in (0..<n).reversed() {
            res[i] *= right
            right *= nums[i]
        }
        return res
    }
}
