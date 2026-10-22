let t = Trie()
t.insert("apple")
precondition(t.search("apple") && !t.search("app") && t.startsWith("app"))
t.insert("app")
precondition(t.search("app"))

for _ in 0..<200 {
    let tr = Trie()
    var set = Set<String>()
    for _ in 0..<30 {
        let w = String((0..<Int.random(in: 1...4)).map { _ in "abc".randomElement()! })
        tr.insert(w); set.insert(w)
    }
    for _ in 0..<50 {
        let q = String((0..<Int.random(in: 1...5)).map { _ in "abc".randomElement()! })
        precondition(tr.search(q) == set.contains(q))
        precondition(tr.startsWith(q) == set.contains { $0.hasPrefix(q) })
    }
}
print("OK")
