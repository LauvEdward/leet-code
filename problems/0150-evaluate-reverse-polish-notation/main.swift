func check(_ t: [String], _ want: Int, line: UInt = #line) {
    let got = Solution().evalRPN(t)
    precondition(got == want, "line \(line): got \(got), want \(want)")
}

check(["2", "1", "+", "3", "*"], 9)
check(["4", "13", "5", "/", "+"], 6)
check(["10", "6", "9", "3", "+", "-11", "*", "/", "*", "17", "+", "5", "+"], 22)
check(["7"], 7)
check(["-7", "2", "/"], -3)
check(["3", "-4", "-"], 7)
print("OK")
