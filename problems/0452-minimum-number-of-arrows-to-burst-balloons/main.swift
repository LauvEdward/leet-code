// vét cạn: thử mọi tập vị trí bắn trong các mép phải (đủ để có lời giải tối ưu)
func brute(_ a: [[Int]]) -> Int {
    let xs = Array(Set(a.map { $0[1] })).sorted()
    var best = Int.max
    for mask in 1..<(1 << xs.count) {
        let shots = (0..<xs.count).filter { mask >> $0 & 1 == 1 }.map { xs[$0] }
        if a.allSatisfy({ b in shots.contains { $0 >= b[0] && $0 <= b[1] } }) { best = min(best, shots.count) }
    }
    return best
}

precondition(Solution().findMinArrowShots([[10, 16], [2, 8], [1, 6], [7, 12]]) == 2)
precondition(Solution().findMinArrowShots([[1, 2], [3, 4], [5, 6], [7, 8]]) == 4)
precondition(Solution().findMinArrowShots([[1, 2], [2, 3], [3, 4], [4, 5]]) == 2)
precondition(Solution().findMinArrowShots([[-2147483648, 2147483647]]) == 1)
for _ in 0..<2000 {
    let a = (0..<Int.random(in: 1...6)).map { _ -> [Int] in let s = Int.random(in: -5...10); return [s, s + Int.random(in: 0...5)] }
    precondition(Solution().findMinArrowShots(a) == brute(a), "\(a)")
}
print("OK")
