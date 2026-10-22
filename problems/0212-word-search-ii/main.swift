func g(_ rows: [String]) -> [[Character]] { rows.map { Array($0) } }
// kiểm tra từng từ bằng DFS độc lập (như bài 79)
func exists(_ b: [[Character]], _ w: [Character]) -> Bool {
    var b = b
    let m = b.count, n = b[0].count
    func go(_ i: Int, _ j: Int, _ k: Int) -> Bool {
        if k == w.count { return true }
        if i < 0 || i >= m || j < 0 || j >= n || b[i][j] != w[k] { return false }
        let c = b[i][j]; b[i][j] = "#"
        let ok = go(i + 1, j, k + 1) || go(i - 1, j, k + 1) || go(i, j + 1, k + 1) || go(i, j - 1, k + 1)
        b[i][j] = c
        return ok
    }
    for i in 0..<m { for j in 0..<n where go(i, j, 0) { return true } }
    return false
}

let b1 = g(["oaan", "etae", "ihkr", "iflv"])
precondition(Set(Solution().findWords(b1, ["oath", "pea", "eat", "rain"])) == ["eat", "oath"])
precondition(Solution().findWords(g(["ab", "cd"]), ["abcb"]) == [])
precondition(Solution().findWords(g(["a"]), ["a", "a"]) == ["a"])
for _ in 0..<300 {
    let m = Int.random(in: 1...4), n = Int.random(in: 1...4)
    let b = (0..<m).map { _ in (0..<n).map { _ in "abc".randomElement()! } }
    let words = Array(Set((0..<10).map { _ in String((0..<Int.random(in: 1...5)).map { _ in "abc".randomElement()! }) }))
    let got = Solution().findWords(b, words)
    precondition(got.count == Set(got).count)
    precondition(Set(got) == Set(words.filter { exists(b, Array($0)) }))
}
print("OK")
