func g(_ rows: [String]) -> [[Character]] { rows.map { Array($0) } }
// đếm bằng hợp nhất (union-find) để đối chiếu
func brute(_ a: [[Character]]) -> Int {
    let m = a.count, n = a[0].count
    var p = Array(0..<(m * n))
    func f(_ x: Int) -> Int { var x = x; while p[x] != x { x = p[x] }; return x }
    var cnt = 0
    for i in 0..<m { for j in 0..<n where a[i][j] == "1" {
        cnt += 1
        for (di, dj) in [(-1, 0), (0, -1)] {
            let x = i + di, y = j + dj
            if x >= 0 && y >= 0 && a[x][y] == "1" {
                let ra = f(i * n + j), rb = f(x * n + y)
                if ra != rb { p[ra] = rb; cnt -= 1 }
            }
        }
    } }
    return cnt
}

precondition(Solution().numIslands(g(["11110", "11010", "11000", "00000"])) == 1)
precondition(Solution().numIslands(g(["11000", "11000", "00100", "00011"])) == 3)
precondition(Solution().numIslands(g(["0"])) == 0)
for _ in 0..<2000 {
    let m = Int.random(in: 1...6), n = Int.random(in: 1...6)
    let a = (0..<m).map { _ in (0..<n).map { _ in Character(Bool.random() ? "1" : "0") } }
    precondition(Solution().numIslands(a) == brute(a))
}
// lưới 300x300 toàn đất: phải không tràn ngăn xếp
precondition(Solution().numIslands([[Character]](repeating: [Character](repeating: "1", count: 300), count: 300)) == 1)
print("OK")
