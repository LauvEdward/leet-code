class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 { return false }

        var n = x, rev = 0
        while n > 0 {
            rev = rev * 10 + n % 10
            n /= 10
        }
        return rev == x
    }
}
