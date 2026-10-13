func brute(_ s: String, _ words: [String]) -> [Int] {
    let a = Array(s), L = words[0].count, total = L * words.count
    var res = [Int]()
    if a.count < total { return res }
    let want = words.sorted()
    for i in 0...(a.count - total) {
        let parts = (0..<words.count).map { String(a[i + $0 * L..<i + ($0 + 1) * L]) }
        if parts.sorted() == want { res.append(i) }
    }
    return res
}
func check(_ s: String, _ words: [String], line: UInt = #line) {
    let got = Solution().findSubstring(s, words).sorted()
    let want = brute(s, words)
    precondition(got == want, "line \(line): '\(s)' \(words): got \(got), want \(want)")
}

precondition(Solution().findSubstring("barfoothefoobarman", ["foo", "bar"]).sorted() == [0, 9])
precondition(Solution().findSubstring("wordgoodgoodgoodbestword", ["word", "good", "best", "word"]) == [])
precondition(Solution().findSubstring("barfoofoobarthefoobarman", ["bar", "foo", "the"]).sorted() == [6, 9, 12])
check("aaaa", ["a", "a"])
check("ab", ["abc"])
check("wordgoodgoodgoodbestword", ["word", "good", "best", "good"])
for _ in 0..<4000 {
    let L = Int.random(in: 1...2)
    let s = String((0..<Int.random(in: 1...14)).map { _ in "ab".randomElement()! })
    let words = (0..<Int.random(in: 1...3)).map { _ in String((0..<L).map { _ in "ab".randomElement()! }) }
    check(s, words)
}
print("OK")
