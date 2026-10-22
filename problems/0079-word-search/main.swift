func g(_ rows: [String]) -> [[Character]] { rows.map { Array($0) } }
let b = g(["ABCE", "SFCS", "ADEE"])
precondition(Solution().exist(b, "ABCCED"))
precondition(Solution().exist(b, "SEE"))
precondition(!Solution().exist(b, "ABCB"))
precondition(Solution().exist(g(["a"]), "a"))
precondition(!Solution().exist(g(["a"]), "aa"))
precondition(Solution().exist(g(["ab", "cd"]), "acdb"))
print("OK")
