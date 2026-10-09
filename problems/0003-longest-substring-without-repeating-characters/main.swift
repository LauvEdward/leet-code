func check(_ input: String, _ want: Int, line: UInt = #line) {
    let got = Solution().lengthOfLongestSubstring(input)
    precondition(got == want, "line \(line): got \(got), want \(want)")
}

check("abcabcbb", 3)
check("bbbbb", 1)
check("pwwkew", 3)
check("", 0)
check(" ", 1)
check("abba", 2)
check("dvdf", 3)
check("tmmzuxt", 5)
print("OK")
