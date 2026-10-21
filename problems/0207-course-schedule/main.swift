// có chu trình không: DFS ba màu
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

precondition(Solution().canFinish(2, [[1, 0]]))
precondition(!Solution().canFinish(2, [[1, 0], [0, 1]]))
precondition(Solution().canFinish(1, []))
precondition(!Solution().canFinish(3, [[0, 0]]))
for _ in 0..<3000 {
    let n = Int.random(in: 1...6)
    let pre = (0..<Int.random(in: 0...7)).map { _ in [Int.random(in: 0..<n), Int.random(in: 0..<n)] }
    precondition(Solution().canFinish(n, pre) == !hasCycle(n, pre), "\(n) \(pre)")
}
print("OK")
