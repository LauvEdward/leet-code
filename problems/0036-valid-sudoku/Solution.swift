class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        var rows = [Set<Character>](repeating: [], count: 9)
        var cols = [Set<Character>](repeating: [], count: 9)
        var boxes = [Set<Character>](repeating: [], count: 9)

        for i in 0..<9 {
            for j in 0..<9 {
                let c = board[i][j]
                if c == "." { continue }
                let b = (i / 3) * 3 + j / 3
                // insert trả về inserted = false nếu đã có
                if !rows[i].insert(c).inserted || !cols[j].insert(c).inserted || !boxes[b].insert(c).inserted {
                    return false
                }
            }
        }
        return true
    }
}
