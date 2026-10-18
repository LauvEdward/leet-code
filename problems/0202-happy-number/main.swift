func check(_ n: Int, _ want: Bool, line: UInt = #line) {
    let got = Solution().isHappy(n)
    precondition(got == want, "line \(line): \(n): got \(got), want \(want)")
}

check(19, true)
check(2, false)
check(1, true)
check(7, true)
check(4, false)
check(2147483647, false)
// các số vui nhỏ hơn 50 (dãy đã biết)
let happy: Set<Int> = [1, 7, 10, 13, 19, 23, 28, 31, 32, 44, 49]
for n in 1..<50 { check(n, happy.contains(n)) }
print("OK")
