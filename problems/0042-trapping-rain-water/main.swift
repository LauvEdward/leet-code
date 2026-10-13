func check(_ a: [Int], _ want: Int, line: UInt = #line) {
    let got = Solution().trap(a)
    precondition(got == want, "line \(line): \(a): got \(got), want \(want)")
}
func brute(_ a: [Int]) -> Int {
    var res = 0
    for i in 0..<a.count {
        res += min(a[...i].max()!, a[i...].max()!) - a[i]
    }
    return res
}

check([0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1], 6)
check([4, 2, 0, 3, 2, 5], 9)
check([5], 0)
check([3, 0, 3], 3)
check([1, 2, 3, 4], 0)
for _ in 0..<3000 {
    let a = (0..<Int.random(in: 1...12)).map { _ in Int.random(in: 0...6) }
    check(a, brute(a))
}
print("OK")
