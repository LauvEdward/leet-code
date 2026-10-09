import Foundation

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

for _ in 0..<20000 {
    let n = Int.random(in: 1...10)
    let k = Int.random(in: 1...14)
    let a = (0..<n).map { _ in Int.random(in: -20...20) }
    check(a, k, brute(a, k))
}

// kích thước tối đa: phải chạy nhanh
let big = (0..<100_000).map { _ in Int.random(in: -100_000...100_000) }
let t0 = Date()
_ = Solution().longestSubarray(big, 3000)
_ = Solution().longestSubarray(big, 2999)
precondition(Date().timeIntervalSince(t0) < 5, "quá chậm")
print("OK")
