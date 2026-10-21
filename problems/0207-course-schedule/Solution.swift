class Solution {
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var indeg = [Int](repeating: 0, count: numCourses)
        var adj = [[Int]](repeating: [], count: numCourses)
        for p in prerequisites {
            adj[p[1]].append(p[0])   // học p[1] xong mới học được p[0]
            indeg[p[0]] += 1
        }

        // Kahn: lần lượt lấy các môn không còn điều kiện tiên quyết
        var q = (0..<numCourses).filter { indeg[$0] == 0 }
        var done = 0
        while let c = q.popLast() {
            done += 1
            for nx in adj[c] {
                indeg[nx] -= 1
                if indeg[nx] == 0 { q.append(nx) }
            }
        }
        return done == numCourses
    }
}
