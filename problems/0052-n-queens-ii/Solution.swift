class Solution {
    func totalNQueens(_ n: Int) -> Int {
        var cols = Set<Int>(), d1 = Set<Int>(), d2 = Set<Int>()
        var cnt = 0

        // đặt hậu cho từng hàng
        func go(_ r: Int) {
            if r == n {
                cnt += 1
                return
            }
            for c in 0..<n where !cols.contains(c) && !d1.contains(r - c) && !d2.contains(r + c) {
                cols.insert(c); d1.insert(r - c); d2.insert(r + c)
                go(r + 1)
                cols.remove(c); d1.remove(r - c); d2.remove(r + c)
            }
        }
        go(0)
        return cnt
    }
}
