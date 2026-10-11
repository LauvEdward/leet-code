func check(_ a: [Int], _ want: Int, line: UInt = #line) {
    let got = Solution().jump(a)
    precondition(got == want, "line \(line): \(a): got \(got), want \(want)")
}
func brute(_ a: [Int]) -> Int {
    var d = [Int](repeating: Int.max, count: a.count)
    d[0] = 0
    for i in 0..<a.count where d[i] != Int.max {
        for j in i...min(a.count - 1, i + a[i]) { d[j] = min(d[j], d[i] + (j == i ? 0 : 1)) }
    }
    return d[a.count - 1]
}

check([2, 3, 1, 1, 4], 2)
check([2, 3, 0, 1, 4], 2)
check([0], 0)
check([1, 1, 1, 1], 3)
check([5, 1, 1, 1, 1], 1)
for _ in 0..<2000 {
    // đề đảm bảo luôn tới được đích: ép mỗi ô >= 1
    let a = (0..<Int.random(in: 1...9)).map { _ in Int.random(in: 1...4) }
    check(a, brute(a))
}
print("OK")
