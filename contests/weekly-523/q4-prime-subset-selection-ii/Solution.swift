class Solution {
    func maxPrimeSubset(_ n: Int, _ s: Int) -> [Int] {
        var ps = [Int]()
        for x in stride(from: 2, through: n, by: 1) {
            if ps.allSatisfy({ x % $0 != 0 }) { ps.append(x) }
        }
        let m = ps.count
        let INF = Int.max / 2

        // g[i][t]: số phần tử ít nhất chọn từ ps[i...] để có tổng đúng bằng t
        var g = [[Int]](repeating: [Int](repeating: INF, count: s + 1), count: m + 1)
        g[m][0] = 0
        for i in (0..<m).reversed() {
            for t in 0...s {
                g[i][t] = g[i + 1][t]
                if t >= ps[i] {
                    g[i][t] = min(g[i][t], g[i + 1][t - ps[i]] + 1)
                }
            }
        }

        // tổng lớn nhất đạt được
        var t = s
        while t > 0 && g[0][t] >= INF { t -= 1 }

        // dựng lại: mỗi vị trí chọn số nhỏ nhất mà vẫn kịp đủ số lượng
        var res = [Int]()
        var i = 0, k = g[0][t]
        while k > 0 {
            for j in i..<m where ps[j] <= t && g[j + 1][t - ps[j]] == k - 1 {
                res.append(ps[j])
                t -= ps[j]
                k -= 1
                i = j + 1
                break
            }
        }
        return res
    }
}
