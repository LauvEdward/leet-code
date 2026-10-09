func check(_ s: String, _ want: Int, line: UInt = #line) {
    let got = Solution().minRotations(s.count, s)
    precondition(got == want, "line \(line): \(s): got \(got), want \(want)")
}

func cost(_ a: [Int]) -> Int {
    var cur = 0, res = 0
    for x in a {
        let t = abs(x - cur)
        res += min(t, 10 - t)
        cur = x
    }
    return res
}

// thử mọi cách đảo đuôi
func brute(_ s: String) -> Int {
    let a = s.map { $0.wholeNumberValue! }
    var best = cost(a)
    for k in 0..<a.count {
        best = min(best, cost(Array(a[..<k]) + a[k...].reversed()))
    }
    return best
}

check("1502", 9)
check("2916", 12)
check("4219", 6)
check("0", 0)
check("5", 5)

for _ in 0..<3000 {
    let n = Int.random(in: 1...9)
    let s = String((0..<n).map { _ in Character(String(Int.random(in: 0...9))) })
    check(s, brute(s))
}
print("OK")
