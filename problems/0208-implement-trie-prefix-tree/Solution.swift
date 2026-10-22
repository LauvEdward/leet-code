class Trie {
    class Node {
        var kids = [Character: Node]()
        var end = false
    }

    let root = Node()

    init() {
    }

    func insert(_ word: String) {
        var n = root
        for c in word {
            if n.kids[c] == nil { n.kids[c] = Node() }
            n = n.kids[c]!
        }
        n.end = true
    }

    // đi theo tiền tố, trả về nút cuối (nil nếu đứt giữa chừng)
    func walk(_ s: String) -> Node? {
        var n = root
        for c in s {
            guard let nx = n.kids[c] else { return nil }
            n = nx
        }
        return n
    }

    func search(_ word: String) -> Bool {
        return walk(word)?.end == true
    }

    func startsWith(_ prefix: String) -> Bool {
        return walk(prefix) != nil
    }
}
