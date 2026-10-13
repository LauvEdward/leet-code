func check(_ s: String, _ want: Bool, line: UInt = #line) {
    let got = Solution().isPalindrome(s)
    precondition(got == want, "line \(line): '\(s)': got \(got), want \(want)")
}

check("A man, a plan, a canal: Panama", true)
check("race a car", false)
check(" ", true)
check("0P", false)
check("ab_a", true)
check(".,", true)
check("1b1", true)
print("OK")
