class Solution {
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        var res = [[Int]]()
        var cur = newInterval
        var i = 0, n = intervals.count

        // các khoảng nằm hẳn bên trái
        while i < n && intervals[i][1] < cur[0] {
            res.append(intervals[i])
            i += 1
        }
        // các khoảng chồng lên: gộp vào cur
        while i < n && intervals[i][0] <= cur[1] {
            cur[0] = min(cur[0], intervals[i][0])
            cur[1] = max(cur[1], intervals[i][1])
            i += 1
        }
        res.append(cur)
        // phần còn lại bên phải
        while i < n {
            res.append(intervals[i])
            i += 1
        }
        return res
    }
}
