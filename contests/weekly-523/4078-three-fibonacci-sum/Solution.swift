class Solution {
    func threeFibonacciSum(_ n: Int) -> Bool {
        var a = 0, b = 1, c = 1
        while a + b + c <= n {
            if a + b + c == n { return true }
            (a, b, c) = (b, c, b + c)
        }
        return false
    }
}
