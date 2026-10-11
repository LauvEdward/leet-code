func check(_ a: [Int], line: UInt = #line) {
    let got = Solution().productExceptSelf(a)
    let want = a.indices.map { i in a.indices.filter { $0 != i }.map { a[$0] }.reduce(1, *) }
    precondition(got == want, "line \(line): \(a): got \(got), want \(want)")
}

precondition(Solution().productExceptSelf([1, 2, 3, 4]) == [24, 12, 8, 6])
precondition(Solution().productExceptSelf([-1, 1, 0, -3, 3]) == [0, 0, 9, 0, 0])
check([0, 0])
check([2, 3])
for _ in 0..<2000 {
    check((0..<Int.random(in: 2...8)).map { _ in Int.random(in: -4...4) })
}
print("OK")
