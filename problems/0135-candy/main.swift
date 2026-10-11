func check(_ a: [Int], _ want: Int, line: UInt = #line) {
    let got = Solution().candy(a)
    precondition(got == want, "line \(line): \(a): got \(got), want \(want)")
}
// tăng dần cho tới khi mọi ràng buộc thỏa: ra nghiệm nhỏ nhất
func brute(_ a: [Int]) -> Int {
    var c = [Int](repeating: 1, count: a.count)
    var changed = true
    while changed {
        changed = false
        for i in 0..<a.count {
            if i > 0 && a[i] > a[i - 1] && c[i] <= c[i - 1] { c[i] = c[i - 1] + 1; changed = true }
            if i < a.count - 1 && a[i] > a[i + 1] && c[i] <= c[i + 1] { c[i] = c[i + 1] + 1; changed = true }
        }
    }
    return c.reduce(0, +)
}

check([1, 0, 2], 5)
check([1, 2, 2], 4)
check([5], 1)
check([1, 2, 3, 4], 10)
check([4, 3, 2, 1], 10)
check([1, 3, 4, 5, 2], 11)
for _ in 0..<3000 {
    let a = (0..<Int.random(in: 1...10)).map { _ in Int.random(in: 0...5) }
    check(a, brute(a))
}
print("OK")
