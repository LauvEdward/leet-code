class Solution {
    func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        var indeg = [Int](repeating: 0, count: numCourses)
        var adj = [[Int]](repeating: [], count: numCourses)
        for p in prerequisites {
            adj[p[1]].append(p[0])
            indeg[p[0]] += 1
        }

        var q = (0..<numCourses).filter { indeg[$0] == 0 }
        var order = [Int]()
        while let c = q.popLast() {
            order.append(c)
            for nx in adj[c] {
                indeg[nx] -= 1
                if indeg[nx] == 0 { q.append(nx) }
            }
        }
        // còn môn chưa học được → có vòng lặp điều kiện
        return order.count == numCourses ? order : []
    }
}
