class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        let a = candidates.sorted()
        var res = [[Int]]()
        var cur = [Int]()

        // chỉ chọn từ chỉ số start trở đi để mỗi tổ hợp xuất hiện một lần
        func go(_ start: Int, _ rest: Int) {
            if rest == 0 {
                res.append(cur)
                return
            }
            for i in start..<a.count {
                if a[i] > rest { break }   // đã sắp tăng, số sau còn lớn hơn
                cur.append(a[i])
                go(i, rest - a[i])          // vẫn là i: được dùng lại
                cur.removeLast()
            }
        }
        go(0, target)
        return res
    }
}
