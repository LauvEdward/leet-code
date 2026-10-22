precondition(Solution().snakesAndLadders([[-1, -1, -1, -1, -1, -1], [-1, -1, -1, -1, -1, -1], [-1, -1, -1, -1, -1, -1],
                                          [-1, 35, -1, -1, 13, -1], [-1, -1, -1, -1, -1, -1], [-1, 15, -1, -1, -1, -1]]) == 4)
precondition(Solution().snakesAndLadders([[-1, -1], [-1, 3]]) == 1)
precondition(Solution().snakesAndLadders([[-1, -1, -1], [-1, 9, 8], [-1, 8, 9]]) == 1)
// bảng trống 6x6: 36 ô cần ceil(35 / 6) = 6 lượt
precondition(Solution().snakesAndLadders([[Int]](repeating: [Int](repeating: -1, count: 6), count: 6)) == 6)
// bị chặn: mọi ô 2..7 đều là rắn kéo về 1
var trap = [[Int]](repeating: [Int](repeating: -1, count: 3), count: 3)
for s in 2...7 { let q = (s - 1) / 3, r = (s - 1) % 3; trap[2 - q][q % 2 == 0 ? r : 2 - r] = 1 }
precondition(Solution().snakesAndLadders(trap) == -1)
print("OK")
