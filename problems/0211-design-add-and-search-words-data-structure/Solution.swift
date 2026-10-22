class WordDictionary {
    class Node {
        var kids = [Character: Node]()
        var end = false
    }

    let root = Node()

    init() {
    }

    func addWord(_ word: String) {
        var n = root
        for c in word {
            if n.kids[c] == nil { n.kids[c] = Node() }
            n = n.kids[c]!
        }
        n.end = true
    }

    func search(_ word: String) -> Bool {
        return dfs(Array(word), 0, root)
    }

    // '.' khớp mọi ký tự → thử hết các nhánh con
    func dfs(_ w: [Character], _ i: Int, _ n: Node) -> Bool {
        if i == w.count { return n.end }
        if w[i] == "." {
            for (_, k) in n.kids where dfs(w, i + 1, k) { return true }
            return false
        }
        guard let k = n.kids[w[i]] else { return false }
        return dfs(w, i + 1, k)
    }
}
