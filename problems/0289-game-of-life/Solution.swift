class Solution {
    func gameOfLife(_ board: inout [[Int]]) {
        let old = board
        let m = old.count, n = old[0].count

        for i in 0..<m {
            for j in 0..<n {
                // đếm hàng xóm còn sống trên bản cũ
                var live = 0
                for di in -1...1 {
                    for dj in -1...1 where di != 0 || dj != 0 {
                        let x = i + di, y = j + dj
                        if x >= 0 && x < m && y >= 0 && y < n && old[x][y] == 1 { live += 1 }
                    }
                }
                if old[i][j] == 1 {
                    board[i][j] = (live == 2 || live == 3) ? 1 : 0
                } else {
                    board[i][j] = live == 3 ? 1 : 0
                }
            }
        }
    }
}
