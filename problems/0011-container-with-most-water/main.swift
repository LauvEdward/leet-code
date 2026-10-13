func check(_ a: [Int], _ want: Int, line: UInt = #line) {
    let got = Solution().maxArea(a)
    precondition(got == want, "line \(line): \(a): got \(got), want \(want)")
}
func brute(_ a: [Int]) -> Int {
    var best = 0
    for i in 0..<a.count { for j in i + 1..<a.count { best = max(best, min(a[i], a[j]) * (j - i)) } }
    return best
}

check([1, 8, 6, 2, 5, 4, 8, 3, 7], 49)
check([1, 1], 1)
check([4, 3, 2, 1, 4], 16)
check([1, 2, 1], 2)
for _ in 0..<3000 {
    let a = (0..<Int.random(in: 2...10)).map { _ in Int.random(in: 0...9) }
    check(a, brute(a))
}
print("OK")
