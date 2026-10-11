func check(_ a: [Int], _ want: Int, line: UInt = #line) {
    let got = Solution().maxProfit(a)
    precondition(got == want, "line \(line): got \(got), want \(want)")
}
func brute(_ a: [Int]) -> Int {
    var best = 0
    for i in 0..<a.count { for j in i..<a.count { best = max(best, a[j] - a[i]) } }
    return best
}

check([7, 1, 5, 3, 6, 4], 5)
check([7, 6, 4, 3, 1], 0)
check([1], 0)
for _ in 0..<1000 {
    let a = (0..<Int.random(in: 1...10)).map { _ in Int.random(in: 0...20) }
    check(a, brute(a))
}
print("OK")
