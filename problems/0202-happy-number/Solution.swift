class Solution {
    func isHappy(_ n: Int) -> Bool {
        var seen = Set<Int>()
        var x = n
        while x != 1 && !seen.contains(x) {
            seen.insert(x)
            var s = 0
            while x > 0 {
                s += (x % 10) * (x % 10)
                x /= 10
            }
            x = s
        }
        return x == 1
    }
}
