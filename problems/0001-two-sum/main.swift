func check(_ got: [Int], _ want: [Int], line: UInt = #line) {
    precondition(got.sorted() == want.sorted(), "line \(line): got \(got), want \(want)")
}

let s = Solution()
check(s.twoSum([2, 7, 11, 15], 9), [0, 1])
check(s.twoSum([3, 2, 4], 6), [1, 2])
check(s.twoSum([3, 3], 6), [0, 1])
check(s.twoSum([-1, -2, -3, -4, -5], -8), [2, 4])
check(s.twoSum([0, 4, 3, 0], 0), [0, 3])
print("OK")
