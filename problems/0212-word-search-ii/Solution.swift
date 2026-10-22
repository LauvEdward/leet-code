class Solution {
    class Node {
        var kids = [Character: Node]()
        var word: String? = nil   // từ kết thúc ở nút này
    }

    func findWords(_ board: [[Character]], _ words: [String]) -> [String] {
        // dựng trie từ danh sách từ
        let root = Node()
        for w in words {
            var n = root
            for c in w {
                if n.kids[c] == nil { n.kids[c] = Node() }
                n = n.kids[c]!
            }
            n.word = w
        }

        var b = board
        let m = b.count, nn = b[0].count
        var res = [String]()

        func dfs(_ i: Int, _ j: Int, _ parent: Node) {
            let c = b[i][j]
            guard let node = parent.kids[c] else { return }
            if let w = node.word {
                res.append(w)
                node.word = nil   // mỗi từ chỉ lấy một lần
            }
            b[i][j] = "#"         // đánh dấu đang dùng
            for (di, dj) in [(1, 0), (-1, 0), (0, 1), (0, -1)] {
                let x = i + di, y = j + dj
                if x >= 0 && x < m && y >= 0 && y < nn && b[x][y] != "#" {
                    dfs(x, y, node)
                }
            }
            b[i][j] = c
            // nhánh đã hết từ thì cắt khỏi trie cho lần sau đỡ tốn
            if node.kids.isEmpty && node.word == nil { parent.kids[c] = nil }
        }

        for i in 0..<m {
            for j in 0..<nn {
                dfs(i, j, root)
            }
        }
        return res
    }
}
