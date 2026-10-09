func check(_ s: String, _ rows: Int, _ want: String, line: UInt = #line) {
    let got = Solution().convert(s, rows)
    precondition(got == want, "line \(line): got \(got), want \(want)")
}

check("PAYPALISHIRING", 3, "PAHNAPLSIIGYIR")
check("PAYPALISHIRING", 4, "PINALSIGYAHRPI")
check("A", 1, "A")
check("AB", 1, "AB")
check("AB", 2, "AB")
check("ABC", 5, "ABC")
check("ABCDE", 2, "ACEBD")
print("OK")
