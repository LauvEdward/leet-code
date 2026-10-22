// số lời giải đã biết cho n = 1…9
let known = [1, 0, 0, 2, 10, 4, 40, 92, 352]
for n in 1...9 { precondition(Solution().totalNQueens(n) == known[n - 1], "n=\(n)") }
print("OK")
