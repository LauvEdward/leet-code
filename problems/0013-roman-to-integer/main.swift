func check(_ s: String, _ want: Int, line: UInt = #line) {
    let got = Solution().romanToInt(s)
    precondition(got == want, "line \(line): \(s): got \(got), want \(want)")
}
func toRoman(_ n: Int) -> String {
    var n = n, out = ""
    for (v, r) in [(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")] {
        while n >= v { out += r; n -= v }
    }
    return out
}

check("III", 3)
check("LVIII", 58)
check("MCMXCIV", 1994)
for n in 1...3999 { check(toRoman(n), n) }
print("OK")
