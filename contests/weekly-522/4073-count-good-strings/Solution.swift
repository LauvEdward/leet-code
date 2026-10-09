class Solution {
    let M = 1_000_000_007

    // trả về (F(n), F(n+1))
    func fib(_ n: Int) -> (Int, Int) {
        if n == 0 { return (0, 1) }
        let (a, b) = fib(n / 2)
        let c = a * ((2 * b - a + M) % M) % M   // F(2k)
        let d = (a * a + b * b) % M             // F(2k+1)
        return n % 2 == 0 ? (c, d) : (d, (c + d) % M)
    }

    func countGoodStrings(_ n: Int) -> Int {
        return 2 * fib(n).0 % M
    }
}
