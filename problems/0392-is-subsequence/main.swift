func check(_ s: String, _ t: String, _ want: Bool, line: UInt = #line) {
    let got = Solution().isSubsequence(s, t)
    precondition(got == want, "line \(line): '\(s)' '\(t)': got \(got), want \(want)")
}
// vét cạn mọi dãy con của t
func brute(_ s: String, _ t: String) -> Bool {
    let a = Array(t)
    for mask in 0..<(1 << a.count) {
        var sub = ""
        for i in 0..<a.count where mask >> i & 1 == 1 { sub.append(a[i]) }
        if sub == s { return true }
    }
    return false
}

check("abc", "ahbgdc", true)
check("axc", "ahbgdc", false)
check("", "abc", true)
check("", "", true)
check("a", "", false)
check("aaa", "aa", false)
for _ in 0..<2000 {
    let s = String((0..<Int.random(in: 0...4)).map { _ in "abc".randomElement()! })
    let t = String((0..<Int.random(in: 0...8)).map { _ in "abc".randomElement()! })
    check(s, t, brute(s, t))
}
print("OK")
