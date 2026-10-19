// tô các điểm 2x (để phân biệt [1,2],[3,4] với [1,4]) rồi đọc lại các đoạn
func brute(_ a: [[Int]]) -> [[Int]] {
    var on = [Bool](repeating: false, count: 50)
    for x in a { for p in (2 * x[0])...(2 * x[1]) { on[p] = true } }
    var res = [[Int]](), p = 0
    while p < 50 {
        if on[p] { var q = p; while q + 1 < 50 && on[q + 1] { q += 1 }; res.append([p / 2, q / 2]); p = q + 1 } else { p += 1 }
    }
    return res
}

precondition(Solution().merge([[1, 3], [2, 6], [8, 10], [15, 18]]) == [[1, 6], [8, 10], [15, 18]])
precondition(Solution().merge([[1, 4], [4, 5]]) == [[1, 5]])
precondition(Solution().merge([[4, 7], [1, 4]]) == [[1, 7]])
precondition(Solution().merge([[1, 4], [2, 3]]) == [[1, 4]])
precondition(Solution().merge([[5, 5]]) == [[5, 5]])
for _ in 0..<3000 {
    let a = (0..<Int.random(in: 1...6)).map { _ -> [Int] in let s = Int.random(in: 0...20); return [s, s + Int.random(in: 0...4)] }
    precondition(Solution().merge(a) == brute(a), "\(a)")
}
print("OK")
