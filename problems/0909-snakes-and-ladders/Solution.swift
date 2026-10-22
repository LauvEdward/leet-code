class Solution {
    func snakesAndLadders(_ board: [[Int]]) -> Int {
        let n = board.count
        let target = n * n

        // ô số s (1-based) nằm ở hàng/cột nào (bảng đánh số zigzag từ dưới lên)
        func cell(_ s: Int) -> (Int, Int) {
            let q = (s - 1) / n, r = (s - 1) % n
            let row = n - 1 - q
            let col = q % 2 == 0 ? r : n - 1 - r
            return (row, col)
        }

        var dist = [Int](repeating: -1, count: target + 1)
        dist[1] = 0
        var q = [1], h = 0
        while h < q.count {
            let s = q[h]
            h += 1
            if s == target { return dist[s] }
            for nx in (s + 1)...min(s + 6, target) {
                let (r, c) = cell(nx)
                let dest = board[r][c] == -1 ? nx : board[r][c]
                if dist[dest] == -1 {
                    dist[dest] = dist[s] + 1
                    q.append(dest)
                }
            }
        }
        return -1
    }
}
