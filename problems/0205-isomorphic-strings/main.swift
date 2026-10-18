func check(_ s: String, _ t: String, _ want: Bool, line: UInt = #line) {
    let got = Solution().isIsomorphic(s, t)
    precondition(got == want, "line \(line): '\(s)' '\(t)': got \(got), want \(want)")
}
// hai chuỗi đẳng cấu khi "mẫu vị trí xuất hiện đầu tiên" giống nhau
func pattern(_ s: String) -> [Int] {
    var first = [Character: Int]()
    return s.enumerated().map { (i, c) in first[c] ?? { first[c] = i; return i }() }
}

check("egg", "add", true)
check("foo", "bar", false)
check("paper", "title", true)
check("badc", "baba", false)
check("ab", "aa", false)
check("a", "z", true)
for _ in 0..<3000 {
    let n = Int.random(in: 1...6)
    let s = String((0..<n).map { _ in "abc".randomElement()! })
    let t = String((0..<n).map { _ in "xyz".randomElement()! })
    check(s, t, pattern(s) == pattern(t))
}
print("OK")
