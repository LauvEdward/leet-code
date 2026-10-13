func check(_ a: [Int], _ t: Int, _ want: [Int], line: UInt = #line) {
    let got = Solution().twoSum(a, t)
    precondition(got == want, "line \(line): got \(got), want \(want)")
}

check([2, 7, 11, 15], 9, [1, 2])
check([2, 3, 4], 6, [1, 3])
check([-1, 0], -1, [1, 2])
check([1, 2, 3, 4, 4, 9, 56, 90], 8, [4, 5])
for _ in 0..<2000 {
    let a = (0..<Int.random(in: 2...10)).map { _ in Int.random(in: -20...20) }.sorted()
    let i = Int.random(in: 0..<a.count - 1), j = Int.random(in: i + 1..<a.count)
    let r = Solution().twoSum(a, a[i] + a[j])
    precondition(r.count == 2 && r[0] < r[1] && a[r[0] - 1] + a[r[1] - 1] == a[i] + a[j])
}
print("OK")
