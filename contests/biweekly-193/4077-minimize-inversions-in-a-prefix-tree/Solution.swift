class Solution {
    var kids = [[Int]]()   // kids[u][c] = nút con theo chữ c, -1 nếu không có
    var mark = [Int]()     // pos trong target của từ kết thúc ở nút, -1 nếu không có
    var res = 0

    // số cặp (x thuộc a, y thuộc b) có x > y; a, b đã sắp tăng
    func cross(_ a: [Int], _ b: [Int]) -> Int {
        var j = 0, cnt = 0
        for x in a {
            while j < b.count && b[j] < x { j += 1 }
            cnt += j
        }
        return cnt
    }

    // trả về danh sách pos (đã sắp) của cả cây con gốc u
    func dfs(_ u: Int) -> [Int] {
        var lists = [[Int]]()
        for c in kids[u] where c != -1 {
            lists.append(dfs(c))
        }
        let m = lists.count

        if m >= 2 {
            // inv[i][j]: số nghịch thế giữa 2 nhánh nếu nhánh i đứng trước nhánh j
            var inv = [[Int]](repeating: [Int](repeating: 0, count: m), count: m)
            for i in 0..<m {
                for j in i + 1..<m {
                    inv[i][j] = cross(lists[i], lists[j])
                    inv[j][i] = lists[i].count * lists[j].count - inv[i][j]
                }
            }

            // dp[mask]: chi phí nhỏ nhất khi các nhánh trong mask được xếp trước
            let full = 1 << m
            var w = [[Int]](repeating: [Int](repeating: 0, count: full), count: m)
            for c in 0..<m {
                for mask in 1..<full {
                    let low = mask.trailingZeroBitCount
                    w[c][mask] = w[c][mask & (mask - 1)] + inv[low][c]
                }
            }
            var dp = [Int](repeating: Int.max, count: full)
            dp[0] = 0
            for mask in 1..<full {
                for c in 0..<m where mask >> c & 1 == 1 {
                    let prev = mask ^ (1 << c)
                    dp[mask] = min(dp[mask], dp[prev] + w[c][prev])
                }
            }
            res += dp[full - 1]
        }

        var all = lists.flatMap { $0 }
        if mark[u] != -1 {
            // từ ở chính nút u luôn được ghi trước mọi từ trong cây con
            res += all.filter { $0 < mark[u] }.count
            all.append(mark[u])
        }
        return all.sorted()
    }

    func minInversions(_ words: [String], _ target: [Int]) -> Int {
        let n = words.count
        var pos = [Int](repeating: 0, count: n)
        for i in 0..<n { pos[target[i]] = i }

        kids = [[Int](repeating: -1, count: 10)]
        mark = [-1]
        for (i, word) in words.enumerated() {
            var u = 0
            for ch in word.utf8 {
                let c = Int(ch) - 97
                if kids[u][c] == -1 {
                    kids[u][c] = kids.count
                    kids.append([Int](repeating: -1, count: 10))
                    mark.append(-1)
                }
                u = kids[u][c]
            }
            mark[u] = pos[i]
        }

        res = 0
        _ = dfs(0)
        return res
    }
}
