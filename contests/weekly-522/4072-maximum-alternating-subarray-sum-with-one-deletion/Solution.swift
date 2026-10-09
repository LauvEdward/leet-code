class Solution {
    func maxAlternatingSum(_ nums: [Int]) -> Int {
        let NEG = Int.min / 2

        // p: phần tử cuối mang dấu +, m: mang dấu -
        // 0: chưa xóa, 1: đã xóa 1 phần tử
        var p0 = NEG, m0 = NEG, p1 = NEG, m1 = NEG
        // p0, m0 của vị trí trước đó nữa (dùng khi xóa phần tử ngay trước)
        var pp0 = NEG, pm0 = NEG
        var best = NEG

        for x in nums {
            let np0 = max(x, m0 + x)
            let nm0 = p0 - x
            let np1 = max(m1, pm0) + x
            let nm1 = max(p1, pp0) - x

            pp0 = p0
            pm0 = m0
            p0 = np0
            m0 = nm0
            p1 = np1
            m1 = nm1

            best = max(best, p0, m0, p1, m1)
        }
        return best
    }
}
