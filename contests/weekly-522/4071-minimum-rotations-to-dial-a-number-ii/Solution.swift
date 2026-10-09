class Solution {
    func minRotations(_ n: Int, _ s: String) -> Int {
        let a = s.map { $0.wholeNumberValue! }

        func d(_ x: Int, _ y: Int) -> Int {
            let t = abs(x - y)
            return min(t, 10 - t)
        }

        var total = 0, prev = 0
        for x in a {
            total += d(prev, x)
            prev = x
        }

        // đảo đuôi từ k: chỉ có bước nối vào đuôi là đổi
        var best = total
        for k in 0..<n {
            let p = k > 0 ? a[k - 1] : 0
            best = min(best, total - d(p, a[k]) + d(p, a[n - 1]))
        }
        return best
    }
}
