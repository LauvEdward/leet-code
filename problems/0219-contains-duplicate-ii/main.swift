func check(_ a: [Int], _ k: Int, _ want: Bool, line: UInt = #line) {
    let got = Solution().containsNearbyDuplicate(a, k)
    precondition(got == want, "line \(line): \(a) k=\(k): got \(got), want \(want)")
}
func brute(_ a: [Int], _ k: Int) -> Bool {
    for i in 0..<a.count { for j in i + 1..<a.count where a[i] == a[j] && j - i <= k { return true } }
    return false
}

check([1, 2, 3, 1], 3, true)
check([1, 0, 1, 1], 1, true)
check([1, 2, 3, 1, 2, 3], 2, false)
check([1], 0, false)
check([1, 1], 0, false)
for _ in 0..<3000 {
    let a = (0..<Int.random(in: 1...10)).map { _ in Int.random(in: 0...4) }
    let k = Int.random(in: 0...5)
    check(a, k, brute(a, k))
}
print("OK")
