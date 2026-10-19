class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        let a = intervals.sorted { $0[0] < $1[0] }
        var res = [[Int]]()
        for x in a {
            // chồng lên khoảng cuối thì nới rộng nó, không thì mở khoảng mới
            if let last = res.last, x[0] <= last[1] {
                res[res.count - 1][1] = max(last[1], x[1])
            } else {
                res.append(x)
            }
        }
        return res
    }
}
