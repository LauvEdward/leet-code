class Solution {
    func candy(_ ratings: [Int]) -> Int {
        let n = ratings.count
        var c = [Int](repeating: 1, count: n)

        // hơn bạn bên trái
        for i in 1..<n where ratings[i] > ratings[i - 1] {
            c[i] = c[i - 1] + 1
        }
        // hơn bạn bên phải
        for i in (0..<n - 1).reversed() where ratings[i] > ratings[i + 1] {
            c[i] = max(c[i], c[i + 1] + 1)
        }
        return c.reduce(0, +)
    }
}
