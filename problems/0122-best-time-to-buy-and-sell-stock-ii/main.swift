func check(_ a: [Int], _ want: Int, line: UInt = #line) {
    let got = Solution().maxProfit(a)
    precondition(got == want, "line \(line): \(a): got \(got), want \(want)")
}
// DP: giữ / không giữ cổ phiếu
func dp(_ a: [Int]) -> Int {
    var cash = 0, hold = -a[0]
    for p in a.dropFirst() {
        (cash, hold) = (max(cash, hold + p), max(hold, cash - p))
    }
    return cash
}

check([7, 1, 5, 3, 6, 4], 7)
check([1, 2, 3, 4, 5], 4)
check([7, 6, 4, 3, 1], 0)
check([3], 0)
for _ in 0..<1000 {
    let a = (0..<Int.random(in: 1...10)).map { _ in Int.random(in: 0...20) }
    check(a, dp(a))
}
print("OK")
