func check(_ n: Int, _ want: Int, line: UInt = #line) {
    let got = Solution().countGoodStrings(n)
    precondition(got == want, "line \(line): n=\(n): got \(got), want \(want)")
}

// kiểm tra "good" đúng theo định nghĩa đệ quy trong đề
var memo = [String: Bool]()
func good(_ s: [Character]) -> Bool {
    let key = String(s)
    if let v = memo[key] { return v }
    var res = Set(s).count == 1 && s.count % 2 == 1
    if !res {
        for i in 1..<max(s.count, 1) where s[i - 1] != s[i] {
            if good(Array(s[..<i])) && good(Array(s[i...])) {
                res = true
                break
            }
        }
    }
    memo[key] = res
    return res
}

func brute(_ n: Int) -> Int {
    var cnt = 0
    for mask in 0..<(1 << n) {
        let s: [Character] = (0..<n).map { mask >> $0 & 1 == 1 ? "a" : "b" }
        if good(s) { cnt += 1 }
    }
    return cnt
}

check(4, 6)
check(3, 4)
check(2, 2)
check(1, 2)
for n in 1...14 {
    check(n, brute(n))
}

// đối chiếu fast doubling với vòng lặp thường
var a = 0, b = 1
for n in 1...5000 {
    (a, b) = (b, (a + b) % 1_000_000_007)
    check(n, 2 * a % 1_000_000_007)
}
_ = Solution().countGoodStrings(1_000_000_000_000_000)
print("OK")
