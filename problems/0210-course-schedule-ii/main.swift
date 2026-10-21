func valid(_ n: Int, _ pre: [[Int]], _ order: [Int]) -> Bool {
    if order.sorted() != Array(0..<n) { return false }
    var pos = [Int](repeating: 0, count: n)
    for (i, c) in order.enumerated() { pos[c] = i }
    return pre.allSatisfy { pos[$0[1]] < pos[$0[0]] }
}
func hasCycle(_ n: Int, _ pre: [[Int]]) -> Bool {
    var adj = [[Int]](repeating: [], count: n)
    for p in pre { adj[p[1]].append(p[0]) }
    var color = [Int](repeating: 0, count: n)
    func dfs(_ u: Int) -> Bool {
        color[u] = 1
        for v in adj[u] { if color[v] == 1 || (color[v] == 0 && dfs(v)) { return true } }
        color[u] = 2
        return false
    }
    return (0..<n).contains { color[$0] == 0 && dfs($0) }
}

precondition(Solution().findOrder(2, [[1, 0]]) == [0, 1])
precondition(valid(4, [[1, 0], [2, 0], [3, 1], [3, 2]], Solution().findOrder(4, [[1, 0], [2, 0], [3, 1], [3, 2]])))
precondition(Solution().findOrder(1, []) == [0])
precondition(Solution().findOrder(2, [[0, 1], [1, 0]]) == [])
for _ in 0..<3000 {
    let n = Int.random(in: 1...6)
    let pre = (0..<Int.random(in: 0...7)).map { _ in [Int.random(in: 0..<n), Int.random(in: 0..<n)] }
    let o = Solution().findOrder(n, pre)
    if hasCycle(n, pre) { precondition(o == []) } else { precondition(valid(n, pre, o), "\(n) \(pre) \(o)") }
}
print("OK")
