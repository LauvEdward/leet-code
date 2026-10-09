func check(_ s: String, _ want: Int, line: UInt = #line) {
    let got = Solution().minRotations(s)
    precondition(got == want, "line \(line): got \(got), want \(want)")
}

check("0192837465", 25)
check("1200210200", 12)
check("0000000000", 0)
check("5555555555", 5)
check("9999999999", 1)
check("0505050505", 45)
print("OK")
