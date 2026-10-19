func mergeAll(_ a: [[Int]]) -> [[Int]] {
    var res = [[Int]]()
    for x in a.sorted(by: { $0[0] < $1[0] }) {
        if let l = res.last, x[0] <= l[1] { res[res.count - 1][1] = max(l[1], x[1]) } else { res.append(x) }
    }
    return res
}

precondition(Solution().insert([[1, 3], [6, 9]], [2, 5]) == [[1, 5], [6, 9]])
precondition(Solution().insert([[1, 2], [3, 5], [6, 7], [8, 10], [12, 16]], [4, 8]) == [[1, 2], [3, 10], [12, 16]])
precondition(Solution().insert([], [5, 7]) == [[5, 7]])
precondition(Solution().insert([[1, 5]], [6, 8]) == [[1, 5], [6, 8]])
precondition(Solution().insert([[3, 5]], [1, 2]) == [[1, 2], [3, 5]])
precondition(Solution().insert([[1, 5]], [5, 7]) == [[1, 7]])
for _ in 0..<3000 {
    let base = mergeAll((0..<Int.random(in: 0...5)).map { _ -> [Int] in let s = Int.random(in: 0...20); return [s, s + Int.random(in: 0...3)] })
    // ép các khoảng rời nhau hẳn (đề cho không chồng nhau)
    var a = [[Int]]()
    for x in base { if let l = a.last, x[0] <= l[1] { continue }; a.append(x) }
    let s = Int.random(in: 0...22), nw = [s, s + Int.random(in: 0...5)]
    precondition(Solution().insert(a, nw) == mergeAll(a + [nw]), "\(a) \(nw)")
}
print("OK")
