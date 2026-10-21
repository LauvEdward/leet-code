class Solution {
    func solve(_ board: inout [[Character]]) {
        let m = board.count, n = board[0].count

        // đánh dấu "#" mọi ô O nối được ra mép bảng
        var st = [(Int, Int)]()
        for i in 0..<m {
            for j in 0..<n where (i == 0 || j == 0 || i == m - 1 || j == n - 1) && board[i][j] == "O" {
                board[i][j] = "#"
                st.append((i, j))
            }
        }
        while let (x, y) = st.popLast() {
            for (dx, dy) in [(1, 0), (-1, 0), (0, 1), (0, -1)] {
                let u = x + dx, v = y + dy
                if u >= 0 && u < m && v >= 0 && v < n && board[u][v] == "O" {
                    board[u][v] = "#"
                    st.append((u, v))
                }
            }
        }

        // O còn lại bị bao vây → X; ô đã đánh dấu trả về O
        for i in 0..<m {
            for j in 0..<n {
                if board[i][j] == "O" { board[i][j] = "X" }
                else if board[i][j] == "#" { board[i][j] = "O" }
            }
        }
    }
}
