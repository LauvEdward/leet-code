func check(_ input: String, _ wants: Set<String>, line: UInt = #line) {
    let got = Solution().longestPalindrome(input)
    precondition(wants.contains(got), "line \(line): got \(got), want one of \(wants)")
}

check("babad", ["bab", "aba"])
check("cbbd", ["bb"])
check("a", ["a"])
check("ac", ["a", "c"])
check("aaaa", ["aaaa"])
check("forgeeksskeegfor", ["geeksskeeg"])
check("abacdfgdcaba", ["aba"])
check("racecar", ["racecar"])
print("OK")
