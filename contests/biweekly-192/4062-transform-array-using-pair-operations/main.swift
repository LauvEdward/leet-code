func check(_ s: [Int], _ t: [Int], _ want: Bool, line: UInt = #line) {
    let got = Solution().canTransform(s, t)
    precondition(got == want, "line \(line): got \(got), want \(want)")
}

// Dựng lại đúng chuỗi thao tác của đề để chắc là tổng bằng nhau thì luôn biến đổi được
func build(_ s: [Int], _ t: [Int]) -> [Int] {
    var a = s
    let last = a.count - 1
    for j in 0..<last {
        // i = last, delta = t[j]
        a[last] = a[last] + a[j] - t[j]
        a[j] = t[j]
    }
    return a
}

check([1, 2, 3], [0, 2, 4], true)
check([-5, -5], [-15, 5], true)
check([1, 2, 1], [0, 2, 5], false)
check([1_000_000_000, 1_000_000_000], [2_000_000_000, 0], true)

for _ in 0..<2000 {
    let n = Int.random(in: 2...8)
    let s = (0..<n).map { _ in Int.random(in: -20...20) }
    var t = (0..<n).map { _ in Int.random(in: -20...20) }
    if Bool.random() { t[n - 1] += s.reduce(0, +) - t.reduce(0, +) }   // ép tổng bằng nhau
    let same = s.reduce(0, +) == t.reduce(0, +)
    check(s, t, same)
    if same { precondition(build(s, t) == t) }
}
print("OK")
