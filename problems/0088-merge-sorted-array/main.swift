func check(_ a: [Int], _ m: Int, _ b: [Int], _ n: Int, line: UInt = #line) {
    var x = a
    Solution().merge(&x, m, b, n)
    let want = (Array(a[..<m]) + b).sorted()
    precondition(x == want, "line \(line): got \(x), want \(want)")
}

check([1, 2, 3, 0, 0, 0], 3, [2, 5, 6], 3)
check([1], 1, [], 0)
check([0], 0, [1], 1)
check([4, 5, 6, 0, 0, 0], 3, [1, 2, 3], 3)
for _ in 0..<2000 {
    let m = Int.random(in: 0...6), n = Int.random(in: 0...6)
    if m + n == 0 { continue }
    let a = (0..<m).map { _ in Int.random(in: -9...9) }.sorted() + [Int](repeating: 0, count: n)
    let b = (0..<n).map { _ in Int.random(in: -9...9) }.sorted()
    check(a, m, b, n)
}
print("OK")
