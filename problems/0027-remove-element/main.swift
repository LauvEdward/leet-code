func check(_ a: [Int], _ val: Int, line: UInt = #line) {
    var x = a
    let k = Solution().removeElement(&x, val)
    let want = a.filter { $0 != val }
    precondition(k == want.count && Array(x[..<k]) == want, "line \(line): got \(k) \(x)")
}

check([3, 2, 2, 3], 3)
check([0, 1, 2, 2, 3, 0, 4, 2], 2)
check([], 1)
check([1, 1, 1], 1)
check([1, 2, 3], 9)
print("OK")
