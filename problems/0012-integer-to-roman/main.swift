func check(_ n: Int, _ want: String, line: UInt = #line) {
    let got = Solution().intToRoman(n)
    precondition(got == want, "line \(line): \(n): got \(got), want \(want)")
}
// đổi ngược lại để kiểm tra mọi số
func fromRoman(_ s: String) -> Int {
    let val: [Character: Int] = ["I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000]
    let a = Array(s)
    var res = 0
    for i in 0..<a.count {
        if i + 1 < a.count && val[a[i]]! < val[a[i + 1]]! { res -= val[a[i]]! } else { res += val[a[i]]! }
    }
    return res
}

check(3749, "MMMDCCXLIX")
check(58, "LVIII")
check(1994, "MCMXCIV")
check(4, "IV")
check(3999, "MMMCMXCIX")
for n in 1...3999 {
    let r = Solution().intToRoman(n)
    precondition(fromRoman(r) == n, "\(n) -> \(r)")
    // không ký hiệu nào lặp quá 3 lần liên tiếp
    for c in ["IIII", "XXXX", "CCCC", "MMMM", "VV", "LL", "DD"] { precondition(!r.contains(c), "\(n) -> \(r)") }
}
print("OK")
