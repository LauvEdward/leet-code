func check(_ m: [[Int]], line: UInt = #line) {
    var x = m
    Solution().rotate(&x)
    let n = m.count
    // phần tử m[i][j] đi tới vị trí [j][n-1-i]
    for i in 0..<n { for j in 0..<n { precondition(x[j][n - 1 - i] == m[i][j], "line \(line)") } }
}

var a = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
Solution().rotate(&a)
precondition(a == [[7, 4, 1], [8, 5, 2], [9, 6, 3]])
var b = [[5, 1, 9, 11], [2, 4, 8, 10], [13, 3, 6, 7], [15, 14, 12, 16]]
Solution().rotate(&b)
precondition(b == [[15, 13, 2, 5], [14, 3, 4, 1], [12, 6, 8, 9], [16, 7, 10, 11]])
for n in 1...7 {
    check((0..<n).map { i in (0..<n).map { j in i * 10 + j } })
}
print("OK")
