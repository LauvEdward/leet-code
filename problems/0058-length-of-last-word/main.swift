func check(_ s: String, _ want: Int, line: UInt = #line) {
    let got = Solution().lengthOfLastWord(s)
    precondition(got == want, "line \(line): got \(got), want \(want)")
}

check("Hello World", 5)
check("   fly me   to   the moon  ", 4)
check("luffy is still joyboy", 6)
check("a", 1)
check("a ", 1)
check(" a", 1)
print("OK")
