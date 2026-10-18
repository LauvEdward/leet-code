func check(_ s: String, _ t: String, _ want: Bool, line: UInt = #line) {
    let got = Solution().isAnagram(s, t)
    precondition(got == want, "line \(line): got \(got), want \(want)")
}

check("anagram", "nagaram", true)
check("rat", "car", false)
check("a", "a", true)
check("ab", "a", false)
check("aacc", "ccac", false)
print("OK")
