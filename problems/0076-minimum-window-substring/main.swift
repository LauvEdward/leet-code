func covers(_ w: Substring, _ t: String) -> Bool {
    var cnt = [Character: Int]()
    for c in w { cnt[c, default: 0] += 1 }
    for c in t { cnt[c, default: 0] -= 1; if cnt[c]! < 0 { return false } }
    return true
}
// độ dài cửa sổ nhỏ nhất bằng vét cạn
func bruteLen(_ s: String, _ t: String) -> Int {
    let a = Array(s)
    var best = 0
    for i in 0..<a.count { for j in i..<a.count where covers(Substring(String(a[i...j])), t) {
        if best == 0 || j - i + 1 < best { best = j - i + 1 }
        break
    } }
    return best
}
func check(_ s: String, _ t: String, line: UInt = #line) {
    let got = Solution().minWindow(s, t)
    let want = bruteLen(s, t)
    precondition(got.count == want, "line \(line): '\(s)' '\(t)': got '\(got)', want len \(want)")
    if want > 0 { precondition(s.contains(got) && covers(Substring(got), t), "line \(line): '\(got)' không hợp lệ") }
}

precondition(Solution().minWindow("ADOBECODEBANC", "ABC") == "BANC")
precondition(Solution().minWindow("a", "a") == "a")
precondition(Solution().minWindow("a", "aa") == "")
check("aa", "aa")
check("ab", "b")
check("bba", "ab")
for _ in 0..<3000 {
    let s = String((0..<Int.random(in: 1...10)).map { _ in "abc".randomElement()! })
    let t = String((0..<Int.random(in: 1...3)).map { _ in "abc".randomElement()! })
    check(s, t)
}
print("OK")
