class Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        var b = board
        let w = Array(word)
        let m = b.count, n = b[0].count

        // khớp w[k...] bắt đầu từ ô (i, j)
        func go(_ i: Int, _ j: Int, _ k: Int) -> Bool {
            if k == w.count { return true }
            if i < 0 || i >= m || j < 0 || j >= n || b[i][j] != w[k] { return false }
            let c = b[i][j]
            b[i][j] = "#"   // không dùng lại ô này trong cùng một đường
            let ok = go(i + 1, j, k + 1) || go(i - 1, j, k + 1) || go(i, j + 1, k + 1) || go(i, j - 1, k + 1)
            b[i][j] = c
            return ok
        }

        for i in 0..<m {
            for j in 0..<n where go(i, j, 0) {
                return true
            }
        }
        return false
    }
}
