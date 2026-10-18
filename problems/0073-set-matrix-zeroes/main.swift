var a = [[1, 1, 1], [1, 0, 1], [1, 1, 1]]
Solution().setZeroes(&a)
precondition(a == [[1, 0, 1], [0, 0, 0], [1, 0, 1]])
var b = [[0, 1, 2, 0], [3, 4, 5, 2], [1, 3, 1, 5]]
Solution().setZeroes(&b)
precondition(b == [[0, 0, 0, 0], [0, 4, 5, 0], [0, 3, 1, 0]])
var c = [[5]]
Solution().setZeroes(&c)
precondition(c == [[5]])

for _ in 0..<1000 {
    let R = Int.random(in: 1...5), C = Int.random(in: 1...5)
    let m = (0..<R).map { _ in (0..<C).map { _ in Int.random(in: 0...3) } }
    var x = m
    Solution().setZeroes(&x)
    for i in 0..<R { for j in 0..<C {
        let zero = m[i].contains(0) || m.contains { $0[j] == 0 }
        precondition(x[i][j] == (zero ? 0 : m[i][j]))
    } }
}
print("OK")
