func brute(_ a: [Int], _ k: Int) -> Int {
    var best = 0
    for l in 0..<a.count {
        for r in l..<a.count {
            let s = a[l...r].reduce(0, +)
            var ok = true
            for i in l...r where (s - a[i]) % k != 0 { ok = false }
            if ok { best = max(best, r - l + 1) }
        }
    }
    return best
}

func check(_ a: [Int], _ k: Int, _ want: Int, line: UInt = #line) {
    let got = Solution().resilientSubarray(a, k)
    precondition(got == want, "line \(line): \(a) k=\(k): got \(got), want \(want)")
}

check([2, 4, 6, 3], 2, 3)
check([1, 4, 7, 1], 3, 4)
check([5, 5, 4, 8], 4, 2)
check([7], 5, 1)
check([2, 2, 2, 2, 2, 2], 4, 5)
check([1, 1, 1, 1], 1, 4)

for _ in 0..<8000 {
    let n = Int.random(in: 1...10)
    let k = Int.random(in: 1...8)
    let a = (0..<n).map { _ in Int.random(in: 1...12) }
    check(a, k, brute(a, k))
}

// kích thước tối đa
let big = (0..<100_000).map { _ in Int.random(in: 1...100_000) }
_ = Solution().resilientSubarray(big, 7)
_ = Solution().resilientSubarray([Int](repeating: 6, count: 100_000), 100_000)
print("OK")
