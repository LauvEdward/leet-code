class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        if numRows == 1 { return s }

        var rows = [String](repeating: "", count: numRows)
        var r = 0, step = 1

        for c in s {
            rows[r].append(c)
            if r == 0 { step = 1 }
            if r == numRows - 1 { step = -1 }
            r += step
        }
        return rows.joined()
    }
}
