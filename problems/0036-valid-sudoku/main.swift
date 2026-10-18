func board(_ rows: [String]) -> [[Character]] { rows.map { Array($0) } }

let ok = board(["53..7....", "6..195...", ".98....6.", "8...6...3", "4..8.3..1", "7...2...6", ".6....28.", "...419..5", "....8..79"])
let bad = board(["83..7....", "6..195...", ".98....6.", "8...6...3", "4..8.3..1", "7...2...6", ".6....28.", "...419..5", "....8..79"])
precondition(Solution().isValidSudoku(ok) == true)
precondition(Solution().isValidSudoku(bad) == false)   // trùng 8 ở cột 0 và ô 3x3 đầu

var empty = [[Character]](repeating: [Character](repeating: ".", count: 9), count: 9)
precondition(Solution().isValidSudoku(empty))
empty[0][0] = "5"; empty[0][8] = "5"            // trùng hàng
precondition(!Solution().isValidSudoku(empty))
empty[0][8] = "."; empty[8][0] = "5"            // trùng cột
precondition(!Solution().isValidSudoku(empty))
empty[8][0] = "."; empty[2][2] = "5"            // trùng ô 3x3
precondition(!Solution().isValidSudoku(empty))
empty[2][2] = "."; empty[4][4] = "5"            // khác hàng, cột, ô → hợp lệ
precondition(Solution().isValidSudoku(empty))
print("OK")
