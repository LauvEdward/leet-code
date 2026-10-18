// mô phỏng bằng hướng đi + đánh dấu đã thăm
func brute(_ m: [[Int]]) -> [Int] {
    let R = m.count, C = m[0].count
    var seen = [[Bool]](repeating: [Bool](repeating: false, count: C), count: R)
    let dr = [0, 1, 0, -1], dc = [1, 0, -1, 0]
    var r = 0, c = 0, d = 0, out = [Int]()
    for _ in 0..<R * C {
        out.append(m[r][c]); seen[r][c] = true
        let nr = r + dr[d], nc = c + dc[d]
        if nr < 0 || nr >= R || nc < 0 || nc >= C || seen[nr][nc] { d = (d + 1) % 4 }
        r += dr[d]; c += dc[d]
    }
    return out
}

precondition(Solution().spiralOrder([[1, 2, 3], [4, 5, 6], [7, 8, 9]]) == [1, 2, 3, 6, 9, 8, 7, 4, 5])
precondition(Solution().spiralOrder([[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12]]) == [1, 2, 3, 4, 8, 12, 11, 10, 9, 5, 6, 7])
precondition(Solution().spiralOrder([[7]]) == [7])
precondition(Solution().spiralOrder([[1, 2, 3]]) == [1, 2, 3])
precondition(Solution().spiralOrder([[1], [2], [3]]) == [1, 2, 3])
for R in 1...6 { for C in 1...6 {
    var k = 0
    let m = (0..<R).map { _ in (0..<C).map { _ in k += 1; return k } }
    precondition(Solution().spiralOrder(m) == brute(m), "\(R)x\(C)")
} }
print("OK")
