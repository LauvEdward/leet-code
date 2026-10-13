func check(_ n: Int, _ want: Bool, line: UInt = #line) {
    let got = Solution().threeFibonacciSum(n)
    precondition(got == want, "line \(line): n=\(n): got \(got), want \(want)")
}

check(16, true)
check(8, false)
check(2, true)
check(1, false)
check(4, true)
check(1_000_000_000, false)

// dựng sẵn mọi tổng 3 số liên tiếp rồi so
var f = [0, 1]
while f[f.count - 1] < 2_000_000_000 { f.append(f[f.count - 1] + f[f.count - 2]) }
var sums = Set<Int>()
for i in 0..<f.count - 2 { sums.insert(f[i] + f[i + 1] + f[i + 2]) }
for n in 1...5000 { check(n, sums.contains(n)) }
for s in sums where s <= 1_000_000_000 { check(s, true) }
print("OK")
