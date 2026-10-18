func check(_ r: String, _ m: String, _ want: Bool, line: UInt = #line) {
    let got = Solution().canConstruct(r, m)
    precondition(got == want, "line \(line): '\(r)' '\(m)': got \(got), want \(want)")
}

check("a", "b", false)
check("aa", "ab", false)
check("aa", "aab", true)
check("", "abc", true)
check("abc", "cba", true)
check("aab", "baa", true)
check("aabb", "aab", false)
print("OK")
