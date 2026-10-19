class Solution {
    func findMinArrowShots(_ points: [[Int]]) -> Int {
        let a = points.sorted { $0[1] < $1[1] }
        var arrows = 1
        var end = a[0][1]   // vị trí mũi tên vừa bắn
        for p in a where p[0] > end {
            // bóng này không bị mũi tên cũ xuyên qua → bắn mũi mới ở mép phải của nó
            arrows += 1
            end = p[1]
        }
        return arrows
    }
}
