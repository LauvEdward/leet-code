func binom(_ n: Int, _ k: Int) -> Int { k == 0 ? 1 : binom(n - 1, k - 1) * n / k }

precondition(Solution().combine(4, 2) == [[1, 2], [1, 3], [1, 4], [2, 3], [2, 4], [3, 4]])
precondition(Solution().combine(1, 1) == [[1]])
for n in 1...9 { for k in 1...n {
    let r = Solution().combine(n, k)
    precondition(r.count == binom(n, k) && Set(r).count == r.count)
    precondition(r.allSatisfy { $0.count == k && $0 == $0.sorted() && Set($0).count == k && $0.allSatisfy { (1...n).contains($0) } })
} }
print("OK")
