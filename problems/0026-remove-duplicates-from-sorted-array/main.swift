func check(_ a: [Int], line: UInt = #line) {
    var x = a
    let k = Solution().removeDuplicates(&x)
    let want = Array(Set(a)).sorted()
    precondition(k == want.count && Array(x[..<k]) == want, "line \(line): got \(k) \(x)")
}

check([1, 1, 2])
check([0, 0, 1, 1, 1, 2, 2, 3, 3, 4])
check([5])
check([2, 2, 2, 2])
check([-3, -1, 0, 7])
print("OK")
