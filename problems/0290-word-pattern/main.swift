func check(_ p: String, _ s: String, _ want: Bool, line: UInt = #line) {
    let got = Solution().wordPattern(p, s)
    precondition(got == want, "line \(line): '\(p)' '\(s)': got \(got), want \(want)")
}

check("abba", "dog cat cat dog", true)
check("abba", "dog cat cat fish", false)
check("aaaa", "dog cat cat dog", false)
check("abba", "dog dog dog dog", false)
check("aaa", "aa aa aa aa", false)
check("a", "x", true)
check("ab", "x y", true)
print("OK")
