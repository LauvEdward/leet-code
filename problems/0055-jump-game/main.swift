func check(_ a: [Int], _ want: Bool, line: UInt = #line) {
    let got = Solution().canJump(a)
    precondition(got == want, "line \(line): \(a): got \(got), want \(want)")
}
func brute(_ a: [Int]) -> Bool {
    var ok = [Bool](repeating: false, count: a.count)
    ok[0] = true
    for i in 0..<a.count where ok[i] {
        for j in i...min(a.count - 1, i + a[i]) { ok[j] = true }
    }
    return ok[a.count - 1]
}

check([2, 3, 1, 1, 4], true)
check([3, 2, 1, 0, 4], false)
check([0], true)
check([0, 1], false)
check([2, 0, 0], true)
for _ in 0..<2000 {
    let a = (0..<Int.random(in: 1...8)).map { _ in Int.random(in: 0...3) }
    check(a, brute(a))
}
print("OK")
