func check(_ s: String, _ want: String, line: UInt = #line) {
    let got = Solution().reverseWords(s)
    precondition(got == want, "line \(line): got '\(got)', want '\(want)'")
}

check("the sky is blue", "blue is sky the")
check("  hello world  ", "world hello")
check("a good   example", "example good a")
check("one", "one")
check("  x  ", "x")
print("OK")
