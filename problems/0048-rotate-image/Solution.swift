class Solution {
    func rotate(_ matrix: inout [[Int]]) {
        let n = matrix.count
        // chuyển vị rồi đảo từng hàng = xoay 90 độ theo chiều kim đồng hồ
        for i in 0..<n {
            for j in i + 1..<n {
                let t = matrix[i][j]
                matrix[i][j] = matrix[j][i]
                matrix[j][i] = t
            }
        }
        for i in 0..<n {
            matrix[i].reverse()
        }
    }
}
