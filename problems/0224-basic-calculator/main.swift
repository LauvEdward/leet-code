import Foundation

func check(_ s: String, _ want: Int, line: UInt = #line) {
    let got = Solution().calculate(s)
    precondition(got == want, "line \(line): '\(s)': got \(got), want \(want)")
}

// sinh biểu thức ngẫu nhiên kèm giá trị đúng
func gen(_ depth: Int) -> (String, Int) {
    if depth == 0 || Int.random(in: 0...2) == 0 {
        let v = Int.random(in: 0...20)
        return ("\(v)", v)
    }
    let (a, va) = gen(depth - 1), (b, vb) = gen(depth - 1)
    switch Int.random(in: 0...3) {
    case 0: return ("\(a) + \(b)", va + vb)
    case 1: return ("\(a)-(\(b))", va - vb)
    case 2: return ("(\(a))", va)
    default: return ("-(\(a))", -va)
    }
}

check("1 + 1", 2)
check(" 2-1 + 2 ", 3)
check("(1+(4+5+2)-3)+(6+8)", 23)
check("-2+ 1", -1)
check("1-(     -2)", 3)
check("-(2+3)", -5)
check("2147483647", 2147483647)
for _ in 0..<3000 {
    let (s, v) = gen(4)
    check(s, v)
}
print("OK")
