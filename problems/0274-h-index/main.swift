func check(_ a: [Int], _ want: Int, line: UInt = #line) {
    let got = Solution().hIndex(a)
    precondition(got == want, "line \(line): \(a): got \(got), want \(want)")
}
func brute(_ a: [Int]) -> Int {
    var best = 0
    for h in 0...a.count where a.filter({ $0 >= h }).count >= h { best = h }
    return best
}

check([3, 0, 6, 1, 5], 3)
check([1, 3, 1], 1)
check([0], 0)
check([100], 1)
check([4, 4, 4, 4], 4)
for _ in 0..<2000 {
    let a = (0..<Int.random(in: 1...10)).map { _ in Int.random(in: 0...10) }
    check(a, brute(a))
}
print("OK")
