func valid(_ s: String) -> Bool {
    var bal = 0
    for c in s { bal += c == "(" ? 1 : -1; if bal < 0 { return false } }
    return bal == 0
}
let catalan = [1, 1, 2, 5, 14, 42, 132, 429, 1430]

precondition(Solution().generateParenthesis(3) == ["((()))", "(()())", "(())()", "()(())", "()()()"])
precondition(Solution().generateParenthesis(1) == ["()"])
for n in 1...8 {
    let r = Solution().generateParenthesis(n)
    precondition(r.count == catalan[n] && Set(r).count == r.count && r.allSatisfy { $0.count == 2 * n && valid($0) })
}
print("OK")
