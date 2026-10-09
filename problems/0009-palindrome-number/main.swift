func check(_ x: Int, _ want: Bool, line: UInt = #line) {
    let got = Solution().isPalindrome(x)
    precondition(got == want, "line \(line): got \(got), want \(want)")
}

check(121, true)
check(-121, false)
check(10, false)
check(0, true)
check(7, true)
check(11, true)
check(1221, true)
check(12321, true)
check(123, false)
check(2147483647, false)
check(2147447412, true)
print("OK")
