func check(_ x: Int, _ want: Int, line: UInt = #line) {
    let got = Solution().reverse(x)
    precondition(got == want, "line \(line): got \(got), want \(want)")
}

check(123, 321)
check(-123, -321)
check(120, 21)
check(0, 0)
check(1534236469, 0)
check(-2147483648, 0)
check(2147483647, 0)
check(1463847412, 2147483641)
check(-1463847412, -2147483641)
check(1563847412, 0)
print("OK")
