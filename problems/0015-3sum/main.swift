func norm(_ r: [[Int]]) -> [[Int]] {
    return r.map { $0.sorted() }.sorted { $0.lexicographicallyPrecedes($1) }
}
func brute(_ a: [Int]) -> [[Int]] {
    var s = Set<[Int]>()
    for i in 0..<a.count { for j in i + 1..<a.count { for k in j + 1..<a.count where a[i] + a[j] + a[k] == 0 {
        s.insert([a[i], a[j], a[k]].sorted())
    } } }
    return norm(Array(s))
}
func check(_ a: [Int], line: UInt = #line) {
    let got = Solution().threeSum(a)
    precondition(Set(got.map { $0.sorted() }).count == got.count, "line \(line): có bộ ba trùng \(got)")
    precondition(norm(got) == brute(a), "line \(line): \(a): got \(got), want \(brute(a))")
}

precondition(norm(Solution().threeSum([-1, 0, 1, 2, -1, -4])) == [[-1, -1, 2], [-1, 0, 1]])
precondition(Solution().threeSum([0, 1, 1]) == [])
precondition(Solution().threeSum([0, 0, 0]) == [[0, 0, 0]])
check([0, 0, 0, 0])
check([-2, 0, 0, 2, 2])
for _ in 0..<3000 {
    check((0..<Int.random(in: 3...10)).map { _ in Int.random(in: -4...4) })
}
print("OK")
