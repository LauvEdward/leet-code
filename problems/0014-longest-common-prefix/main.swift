func check(_ a: [String], _ want: String, line: UInt = #line) {
    let got = Solution().longestCommonPrefix(a)
    precondition(got == want, "line \(line): got \(got), want \(want)")
}

check(["flower", "flow", "flight"], "fl")
check(["dog", "racecar", "car"], "")
check(["a"], "a")
check(["", "b"], "")
check(["ab", "a"], "a")
check(["same", "same", "same"], "same")
check(["interview", "internet", "interval", "into"], "int")
print("OK")
