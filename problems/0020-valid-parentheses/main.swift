import Foundation

func check(_ s: String, _ want: Bool, line: UInt = #line) {
    let got = Solution().isValid(s)
    precondition(got == want, "line \(line): '\(s)': got \(got), want \(want)")
}
// xóa dần các cặp kề nhau
func brute(_ s: String) -> Bool {
    var t = s
    while true {
        let u = t.replacingOccurrences(of: "()", with: "").replacingOccurrences(of: "[]", with: "").replacingOccurrences(of: "{}", with: "")
        if u == t { return t.isEmpty }
        t = u
    }
}

check("()", true)
check("()[]{}", true)
check("(]", false)
check("([])", true)
check("([)]", false)
check("(", false)
check(")", false)
check("{[]}", true)
for _ in 0..<3000 {
    let s = String((0..<Int.random(in: 1...8)).map { _ in "()[]{}".randomElement()! })
    check(s, brute(s))
}
print("OK")
