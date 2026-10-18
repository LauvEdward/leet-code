class Solution {
    func setZeroes(_ matrix: inout [[Int]]) {
        var rows = Set<Int>(), cols = Set<Int>()
        for i in 0..<matrix.count {
            for j in 0..<matrix[0].count where matrix[i][j] == 0 {
                rows.insert(i)
                cols.insert(j)
            }
        }
        for i in 0..<matrix.count {
            for j in 0..<matrix[0].count where rows.contains(i) || cols.contains(j) {
                matrix[i][j] = 0
            }
        }
    }
}
