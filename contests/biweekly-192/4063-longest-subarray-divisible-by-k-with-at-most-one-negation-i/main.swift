func check(_ a: [Int], _ k: Int, _ want: Int, line: UInt = #line) {
    let got = Solution().longestSubarray(a, k)
    precondition(got == want, "line \(line): \(a) k=\(k): got \(got), want \(want)")
}

func brute(_ a: [Int], _ k: Int) -> Int {
    var best = 0
    for l in 0..<a.count {
        for r in l..<a.count {
            let s = a[l...r].reduce(0, +)
            var ok = s % k == 0
            for i in l...r where (s - 2 * a[i]) % k == 0 { ok = true }
            if ok { best = max(best, r - l + 1) }
        }
    }
    return best
}

check([4, 1, 2], 3, 3)
check([5, 3, 4], 7, 2)
check([2, 2, 5], 6, 2)
check([1], 2, 0)
check([1], 1, 1)
check([-3], 3, 1)

for _ in 0..<5000 {
    let n = Int.random(in: 1...9)
    let k = Int.random(in: 1...12)
    let a = (0..<n).map { _ in Int.random(in: -15...15) }
    check(a, k, brute(a, k))
}
print("OK")
