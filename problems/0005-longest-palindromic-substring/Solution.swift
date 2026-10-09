class Solution {
    func longestPalindrome(_ s: String) -> String {
        let a = Array(s)
        let n = a.count
        var start = 0, len = 0

        func expand(_ i: Int, _ j: Int) {
            var l = i, r = j
            while l >= 0 && r < n && a[l] == a[r] {
                l -= 1
                r += 1
            }
            // palindrome là a[l+1...r-1]
            if r - l - 1 > len {
                len = r - l - 1
                start = l + 1
            }
        }

        for i in 0..<n {
            expand(i, i)
            expand(i, i + 1)
        }
        return String(a[start..<start + len])
    }
}
