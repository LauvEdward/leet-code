class Solution {
    func calcEquation(_ equations: [[String]], _ values: [Double], _ queries: [[String]]) -> [Double] {
        // cạnh a -> b với trọng số a / b
        var g = [String: [(String, Double)]]()
        for (i, e) in equations.enumerated() {
            g[e[0], default: []].append((e[1], values[i]))
            g[e[1], default: []].append((e[0], 1 / values[i]))
        }

        // tìm đường từ a tới b, nhân dồn trọng số
        func dfs(_ a: String, _ b: String, _ seen: inout Set<String>) -> Double? {
            if a == b { return 1 }
            seen.insert(a)
            for (nx, w) in g[a, default: []] where !seen.contains(nx) {
                if let r = dfs(nx, b, &seen) { return w * r }
            }
            return nil
        }

        return queries.map { q in
            if g[q[0]] == nil || g[q[1]] == nil { return -1.0 }
            var seen = Set<String>()
            return dfs(q[0], q[1], &seen) ?? -1.0
        }
    }
}
