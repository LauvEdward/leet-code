func check(_ g: [Int], _ c: [Int], _ want: Int, line: UInt = #line) {
    let got = Solution().canCompleteCircuit(g, c)
    precondition(got == want, "line \(line): \(g) \(c): got \(got), want \(want)")
}
// trả về mọi điểm xuất phát đi được hết vòng
func starts(_ g: [Int], _ c: [Int]) -> [Int] {
    let n = g.count
    return (0..<n).filter { s in
        var tank = 0
        for k in 0..<n {
            let i = (s + k) % n
            tank += g[i] - c[i]
            if tank < 0 { return false }
        }
        return true
    }
}

check([1, 2, 3, 4, 5], [3, 4, 5, 1, 2], 3)
check([2, 3, 4], [3, 4, 3], -1)
check([5], [4], 0)
check([4], [5], -1)
for _ in 0..<3000 {
    let n = Int.random(in: 1...7)
    let g = (0..<n).map { _ in Int.random(in: 0...6) }
    let c = (0..<n).map { _ in Int.random(in: 0...6) }
    let ok = starts(g, c)
    let got = Solution().canCompleteCircuit(g, c)
    // đề đảm bảo đáp án duy nhất; với dữ liệu ngẫu nhiên chỉ cần trả về một điểm hợp lệ
    precondition(ok.isEmpty ? got == -1 : ok.contains(got), "\(g) \(c): got \(got), valid \(ok)")
}
print("OK")
