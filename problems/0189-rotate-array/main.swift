func check(_ a: [Int], _ k: Int, line: UInt = #line) {
    var x = a
    Solution().rotate(&x, k)
    var want = a
    for _ in 0..<k { want.insert(want.removeLast(), at: 0) }
    precondition(x == want, "line \(line): got \(x), want \(want)")
}

check([1, 2, 3, 4, 5, 6, 7], 3)
check([-1, -100, 3, 99], 2)
check([1], 0)
check([1], 5)
check([1, 2], 3)
check([1, 2, 3], 3)
print("OK")
