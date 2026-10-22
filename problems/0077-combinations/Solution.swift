class Solution {
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        var res = [[Int]]()
        var cur = [Int]()

        // chọn tiếp các số từ start trở đi (tăng dần để không trùng)
        func go(_ start: Int) {
            if cur.count == k {
                res.append(cur)
                return
            }
            // còn cần k - cur.count số nên không cần thử quá n - (k - cur.count) + 1
            if start > n - (k - cur.count) + 1 { return }
            for x in start...(n - (k - cur.count) + 1) {
                cur.append(x)
                go(x + 1)
                cur.removeLast()
            }
        }
        go(1)
        return res
    }
}
