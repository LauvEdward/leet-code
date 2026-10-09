func check(_ a: [Int], _ b: [Int], _ want: Double, line: UInt = #line) {
    let got = Solution().findMedianSortedArrays(a, b)
    precondition(abs(got - want) < 1e-9, "line \(line): got \(got), want \(want)")
}

check([1, 3], [2], 2.0)
check([1, 2], [3, 4], 2.5)
check([], [1], 1.0)
check([2], [], 2.0)
check([0, 0], [0, 0], 0.0)
check([1, 2, 3, 4, 5], [6, 7, 8, 9, 10], 5.5)
check([6, 7, 8, 9, 10], [1, 2, 3, 4, 5], 5.5)
check([1], [2, 3, 4, 5, 6, 7], 4.0)

// Đối chiếu với cách gộp rồi sắp xếp trên dữ liệu ngẫu nhiên
var rng = SystemRandomNumberGenerator()
for _ in 0..<2000 {
    let a = (0..<Int.random(in: 0...8, using: &rng)).map { _ in Int.random(in: -20...20, using: &rng) }.sorted()
    let b = (0..<Int.random(in: 0...8, using: &rng)).map { _ in Int.random(in: -20...20, using: &rng) }.sorted()
    if a.isEmpty && b.isEmpty { continue }
    let all = (a + b).sorted()
    let k = all.count
    let want = k % 2 == 1 ? Double(all[k / 2]) : Double(all[k / 2 - 1] + all[k / 2]) / 2
    check(a, b, want)
}
print("OK")
