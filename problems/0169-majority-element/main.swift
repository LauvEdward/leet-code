func check(_ a: [Int], _ want: Int, line: UInt = #line) {
    let got = Solution().majorityElement(a)
    precondition(got == want, "line \(line): got \(got), want \(want)")
}

check([3, 2, 3], 3)
check([2, 2, 1, 1, 1, 2, 2], 2)
check([1], 1)
check([6, 5, 5], 5)
for _ in 0..<1000 {
    let n = Int.random(in: 1...15)
    let major = Int.random(in: -5...5)
    var a = [Int](repeating: major, count: n / 2 + 1)
    while a.count < n { a.append(Int.random(in: -5...5)) }
    check(a.shuffled(), major)
}
print("OK")
