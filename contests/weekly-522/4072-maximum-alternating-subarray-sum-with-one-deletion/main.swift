func check(_ a: [Int], _ want: Int, line: UInt = #line) {
    let got = Solution().maxAlternatingSum(a)
    precondition(got == want, "line \(line): \(a): got \(got), want \(want)")
}

// tổng đan dấu lớn nhất của mọi mảng con khác rỗng
func bestSub(_ a: [Int]) -> Int {
    var best = Int.min
    for i in 0..<a.count {
        var s = 0, sign = 1
        for j in i..<a.count {
            s += sign * a[j]
            sign = -sign
            best = max(best, s)
        }
    }
    return best
}

func brute(_ a: [Int]) -> Int {
    var best = bestSub(a)
    if a.count > 1 {
        for k in 0..<a.count {
            var b = a
            b.remove(at: k)
            best = max(best, bestSub(b))
        }
    }
    return best
}

check([5, -5, 1], 11)
check([10, -5, -100], 110)
check([4, 7], 7)
check([-5], -5)
check([-5, -3], -2)

for _ in 0..<5000 {
    let n = Int.random(in: 1...8)
    let a = (0..<n).map { _ in Int.random(in: -10...10) }
    check(a, brute(a))
}
print("OK")
