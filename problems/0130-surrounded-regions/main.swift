func g(_ rows: [String]) -> [[Character]] { rows.map { Array($0) } }
// mỗi ô O: BFS xem có chạm được mép không
func brute(_ a: [[Character]]) -> [[Character]] {
    let m = a.count, n = a[0].count
    var out = a
    for i in 0..<m { for j in 0..<n where a[i][j] == "O" {
        var seen = Set([i * n + j]), q = [(i, j)], free = false
        while let (x, y) = q.popLast() {
            if x == 0 || y == 0 || x == m - 1 || y == n - 1 { free = true }
            for (dx, dy) in [(1, 0), (-1, 0), (0, 1), (0, -1)] {
                let u = x + dx, v = y + dy
                if u >= 0 && u < m && v >= 0 && v < n && a[u][v] == "O" && !seen.contains(u * n + v) { seen.insert(u * n + v); q.append((u, v)) }
            }
        }
        if !free { out[i][j] = "X" }
    } }
    return out
}

var b = g(["XXXX", "XOOX", "XXOX", "XOXX"])
Solution().solve(&b)
precondition(b == g(["XXXX", "XXXX", "XXXX", "XOXX"]))
var c = g(["X"])
Solution().solve(&c)
precondition(c == g(["X"]))
for _ in 0..<2000 {
    let m = Int.random(in: 1...6), n = Int.random(in: 1...6)
    let a = (0..<m).map { _ in (0..<n).map { _ in Character(Bool.random() ? "O" : "X") } }
    var x = a
    Solution().solve(&x)
    precondition(x == brute(a))
}
var big = [[Character]](repeating: [Character](repeating: "O", count: 200), count: 200)
Solution().solve(&big)
precondition(big.allSatisfy { $0.allSatisfy { $0 == "O" } })
print("OK")
