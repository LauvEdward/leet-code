class Solution {
    func isMatch(_ s: String, _ p: String) -> Bool {
        let s = Array(s), p = Array(p)
        let m = s.count, n = p.count

        // dp[i][j]: s[i...] có khớp p[j...] không
        var dp = [[Bool]](repeating: [Bool](repeating: false, count: n + 1), count: m + 1)
        dp[m][n] = true

        for i in (0...m).reversed() {
            for j in (0..<n).reversed() {
                let first = i < m && (p[j] == s[i] || p[j] == ".")

                if j + 1 < n && p[j + 1] == "*" {
                    // bỏ qua "x*" hoặc dùng nó ăn 1 ký tự
                    dp[i][j] = dp[i][j + 2] || (first && dp[i + 1][j])
                } else {
                    dp[i][j] = first && dp[i + 1][j + 1]
                }
            }
        }
        return dp[0][0]
    }
}
