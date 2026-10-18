func check(_ a: [Int], _ want: Int, line: UInt = #line) {
    let got = Solution().longestConsecutive(a)
    precondition(got == want, "line \(line): \(a): got \(got), want \(want)")
}
func brute(_ a: [Int]) -> Int {
    let s = Array(Set(a)).sorted()
    var best = 0, cur = 0
    for i in 0..<s.count {
        cur = (i > 0 && s[i] == s[i - 1] + 1) ? cur + 1 : 1
        best = max(best, cur)
    }
    return best
}

check([100, 4, 200, 1, 3, 2], 4)
check([0, 3, 7, 2, 5, 8, 4, 6, 0, 1], 9)
check([1, 0, 1, 2], 3)
check([], 0)
check([-1, -2, 5], 2)
for _ in 0..<3000 {
    let a = (0..<Int.random(in: 0...12)).map { _ in Int.random(in: -6...6) }
    check(a, brute(a))
}
// mảng lớn, phải chạy tuyến tính
let big = Array(0..<100_000).shuffled()
check(big, 100_000)
print("OK")
