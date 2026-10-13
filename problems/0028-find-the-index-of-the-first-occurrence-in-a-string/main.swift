import Foundation

func check(_ h: String, _ n: String, line: UInt = #line) {
    let got = Solution().strStr(h, n)
    let want = h.range(of: n).map { h.distance(from: h.startIndex, to: $0.lowerBound) } ?? -1
    precondition(got == want, "line \(line): '\(h)' '\(n)': got \(got), want \(want)")
}

precondition(Solution().strStr("sadbutsad", "sad") == 0)
precondition(Solution().strStr("leetcode", "leeto") == -1)
check("a", "a")
check("a", "ab")
check("mississippi", "issip")
check("aaaab", "ab")
for _ in 0..<3000 {
    let h = String((0..<Int.random(in: 1...12)).map { _ in "ab".randomElement()! })
    let n = String((0..<Int.random(in: 1...4)).map { _ in "ab".randomElement()! })
    check(h, n)
}
print("OK")
