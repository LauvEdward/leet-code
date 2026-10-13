func isPrime(_ x: Int) -> Bool {
    if x < 2 { return false }
    var d = 2
    while d * d <= x { if x % d == 0 { return false }; d += 1 }
    return true
}

// số lượng tối đa: vét cạn mọi tập con (n nhỏ)
func bruteCount(_ n: Int, _ s: Int) -> Int {
    let ps = (2...max(n, 2)).filter { $0 <= n && isPrime($0) }
    var best = 0
    for mask in 0..<(1 << ps.count) {
        var sum = 0, cnt = 0
        for (i, p) in ps.enumerated() where mask >> i & 1 == 1 { sum += p; cnt += 1 }
        if sum <= s { best = max(best, cnt) }
    }
    return best
}

func check(_ n: Int, _ s: Int, line: UInt = #line) {
    let r = Solution().maxPrimes(n, s)
    precondition(r == r.sorted() && Set(r).count == r.count, "line \(line): không tăng dần / trùng")
    precondition(r.allSatisfy { isPrime($0) && $0 <= n }, "line \(line): có số không hợp lệ \(r)")
    precondition(r.reduce(0, +) <= s, "line \(line): vượt tổng")
    precondition(r.count == bruteCount(n, s), "line \(line): n=\(n) s=\(s): got \(r)")
}

precondition(Solution().maxPrimes(7, 20) == [2, 3, 5, 7])
precondition(Solution().maxPrimes(15, 15) == [2, 3, 5])
precondition(Solution().maxPrimes(5, 1) == [])
precondition(Solution().maxPrimes(1, 100) == [])
for n in 1...40 { for s in stride(from: 1, through: 120, by: 7) { check(n, s) } }
precondition(Solution().maxPrimes(1_000_000, 1_000_000_000).count > 0)
print("OK")
