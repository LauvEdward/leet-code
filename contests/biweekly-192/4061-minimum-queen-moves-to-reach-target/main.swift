func check(_ s: [Int], _ t: [Int], _ want: Int, line: UInt = #line) {
    let got = Solution().minQueenMoves(s, t)
    precondition(got == want, "line \(line): \(s)->\(t): got \(got), want \(want)")
}

// BFS trên bàn cờ 8x8
func bfs(_ s: [Int], _ t: [Int]) -> Int {
    var dist = [[Int]](repeating: [Int](repeating: -1, count: 9), count: 9)
    var q = [(s[0], s[1])]
    dist[s[0]][s[1]] = 0
    var head = 0
    while head < q.count {
        let (r, c) = q[head]
        head += 1
        for (dr, dc) in [(0, 1), (0, -1), (1, 0), (-1, 0), (1, 1), (1, -1), (-1, 1), (-1, -1)] {
            var nr = r + dr, nc = c + dc
            while nr >= 1 && nr <= 8 && nc >= 1 && nc <= 8 {
                if dist[nr][nc] == -1 {
                    dist[nr][nc] = dist[r][c] + 1
                    q.append((nr, nc))
                }
                nr += dr
                nc += dc
            }
        }
    }
    return dist[t[0]][t[1]]
}

check([8, 1], [1, 8], 1)
check([4, 2], [1, 3], 2)
check([1, 1], [1, 1], 0)

for a in 1...8 { for b in 1...8 { for c in 1...8 { for d in 1...8 {
    check([a, b], [c, d], bfs([a, b], [c, d]))
} } } }
print("OK")
