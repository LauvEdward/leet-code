class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        var g = grid
        let m = g.count, n = g[0].count
        var cnt = 0

        for i in 0..<m {
            for j in 0..<n where g[i][j] == "1" {
                cnt += 1
                // nhấn chìm cả hòn đảo bằng ngăn xếp (tránh đệ quy quá sâu)
                g[i][j] = "0"
                var st = [(i, j)]
                while let (x, y) = st.popLast() {
                    for (dx, dy) in [(1, 0), (-1, 0), (0, 1), (0, -1)] {
                        let u = x + dx, v = y + dy
                        if u >= 0 && u < m && v >= 0 && v < n && g[u][v] == "1" {
                            g[u][v] = "0"
                            st.append((u, v))
                        }
                    }
                }
            }
        }
        return cnt
    }
}
