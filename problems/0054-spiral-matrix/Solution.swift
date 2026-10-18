class Solution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        var top = 0, bottom = matrix.count - 1
        var left = 0, right = matrix[0].count - 1
        var res = [Int]()

        while top <= bottom && left <= right {
            for j in stride(from: left, through: right, by: 1) { res.append(matrix[top][j]) }
            top += 1
            for i in stride(from: top, through: bottom, by: 1) { res.append(matrix[i][right]) }
            right -= 1
            // còn hàng / cột thì mới đi ngược lại, không thì lặp phần tử
            if top <= bottom {
                for j in stride(from: right, through: left, by: -1) { res.append(matrix[bottom][j]) }
                bottom -= 1
            }
            if left <= right {
                for i in stride(from: bottom, through: top, by: -1) { res.append(matrix[i][left]) }
                left += 1
            }
        }
        return res
    }
}
