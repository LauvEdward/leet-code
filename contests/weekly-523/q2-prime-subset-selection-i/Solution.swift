class Solution {
    func maxPrimes(_ n: Int, _ s: Int) -> [Int] {
        if n < 2 { return [] }

        // sàng Eratosthenes
        var isPrime = [Bool](repeating: true, count: n + 1)
        isPrime[0] = false
        isPrime[1] = false
        var i = 2
        while i * i <= n {
            if isPrime[i] {
                var j = i * i
                while j <= n {
                    isPrime[j] = false
                    j += i
                }
            }
            i += 1
        }

        // lấy các số nguyên tố nhỏ nhất cho tới khi hết ngân sách
        var res = [Int](), sum = 0
        for p in 2...n where isPrime[p] {
            if sum + p > s { break }
            sum += p
            res.append(p)
        }
        return res
    }
}
