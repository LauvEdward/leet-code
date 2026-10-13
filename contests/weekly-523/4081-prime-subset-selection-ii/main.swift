func isPrime(_ x: Int) -> Bool {
    if x < 2 { return false }
    var d = 2
    while d * d <= x { if x % d == 0 { return false }; d += 1 }
    return true
}

// vét cạn mọi tập con, so sánh đúng theo 3 tiêu chí của đề
func brute(_ n: Int, _ s: Int) -> [Int] {
    let ps = (1...n).filter { isPrime($0) }
    var best = [Int](), bestSum = 0
    for mask in 1..<max(1 << ps.count, 1) {
        var sub = [Int]()
        for (i, p) in ps.enumerated() where mask >> i & 1 == 1 { sub.append(p) }
        let sum = sub.reduce(0, +)
        if sum > s { continue }
        if sum > bestSum || (sum == bestSum && (sub.count < best.count || (sub.count == best.count && sub.lexicographicallyPrecedes(best)))) {
            best = sub
            bestSum = sum
        }
    }
    return best
}

func check(_ n: Int, _ s: Int, line: UInt = #line) {
    let got = Solution().maxPrimeSubset(n, s)
    let want = brute(n, s)
    precondition(got == want, "line \(line): n=\(n) s=\(s): got \(got), want \(want)")
}

precondition(Solution().maxPrimeSubset(7, 20) == [2, 3, 5, 7])
precondition(Solution().maxPrimeSubset(15, 18) == [5, 13])
precondition(Solution().maxPrimeSubset(5, 1) == [])
precondition(Solution().maxPrimeSubset(1, 1000) == [])
for n in 1...43 { for s in stride(from: 1, through: 150, by: 3) { check(n, s) } }
for _ in 0..<300 { check(Int.random(in: 1...47), Int.random(in: 1...330)) }
_ = Solution().maxPrimeSubset(1000, 1000)
print("OK")
