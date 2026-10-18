func check(_ a: [Int], _ want: [String], line: UInt = #line) {
    let got = Solution().summaryRanges(a)
    precondition(got == want, "line \(line): got \(got), want \(want)")
}

check([0, 1, 2, 4, 5, 7], ["0->2", "4->5", "7"])
check([0, 2, 3, 4, 6, 8, 9], ["0", "2->4", "6", "8->9"])
check([], [])
check([-1], ["-1"])
check([-3, -2, -1, 1], ["-3->-1", "1"])
check([-2147483648, 2147483647], ["-2147483648", "2147483647"])
print("OK")
