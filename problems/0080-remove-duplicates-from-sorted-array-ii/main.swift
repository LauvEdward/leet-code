func check(_ a: [Int], line: UInt = #line) {
    var x = a
    let k = Solution().removeDuplicates(&x)
    var want = [Int]()
    for v in a where want.filter({ $0 == v }).count < 2 { want.append(v) }
    precondition(k == want.count && Array(x[..<k]) == want, "line \(line): got \(k) \(x), want \(want)")
}

check([1, 1, 1, 2, 2, 3])
check([0, 0, 1, 1, 1, 1, 2, 3, 3])
check([1])
check([1, 1])
check([4, 4, 4, 4, 4])
for _ in 0..<1000 {
    check((0..<Int.random(in: 1...12)).map { _ in Int.random(in: 0...4) }.sorted())
}
print("OK")
