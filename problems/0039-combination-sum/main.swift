func norm(_ r: [[Int]]) -> Set<[Int]> { Set(r.map { $0.sorted() }) }
// đếm bằng quy hoạch động số tổ hợp (không tính thứ tự) có tổng bằng target
func countWays(_ c: [Int], _ t: Int) -> Int {
    var dp = [Int](repeating: 0, count: t + 1)
    dp[0] = 1
    for x in c { if x <= t { for s in x...t { dp[s] += dp[s - x] } } }
    return dp[t]
}

precondition(norm(Solution().combinationSum([2, 3, 6, 7], 7)) == [[2, 2, 3], [7]])
precondition(norm(Solution().combinationSum([2, 3, 5], 8)) == [[2, 2, 2, 2], [2, 3, 3], [3, 5]])
precondition(Solution().combinationSum([2], 1) == [])
for _ in 0..<500 {
    let c = Array(Set((0..<Int.random(in: 1...5)).map { _ in Int.random(in: 2...9) }))
    let t = Int.random(in: 1...25)
    let r = Solution().combinationSum(c, t)
    precondition(r.count == countWays(c, t) && norm(r).count == r.count)
    precondition(r.allSatisfy { $0.reduce(0, +) == t && $0.allSatisfy { c.contains($0) } })
}
print("OK")
