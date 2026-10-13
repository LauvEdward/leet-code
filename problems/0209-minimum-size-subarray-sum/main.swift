func check(_ t: Int, _ a: [Int], _ want: Int, line: UInt = #line) {
    let got = Solution().minSubArrayLen(t, a)
    precondition(got == want, "line \(line): t=\(t) \(a): got \(got), want \(want)")
}
func brute(_ t: Int, _ a: [Int]) -> Int {
    var best = 0
    for i in 0..<a.count {
        var s = 0
        for j in i..<a.count {
            s += a[j]
            if s >= t { if best == 0 || j - i + 1 < best { best = j - i + 1 }; break }
        }
    }
    return best
}

check(7, [2, 3, 1, 2, 4, 3], 2)
check(4, [1, 4, 4], 1)
check(11, [1, 1, 1, 1, 1, 1, 1, 1], 0)
check(15, [1, 2, 3, 4, 5], 5)
for _ in 0..<3000 {
    let a = (0..<Int.random(in: 1...10)).map { _ in Int.random(in: 1...9) }
    let t = Int.random(in: 1...40)
    check(t, a, brute(t, a))
}
print("OK")
