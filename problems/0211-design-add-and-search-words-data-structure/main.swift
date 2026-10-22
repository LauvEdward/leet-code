let d = WordDictionary()
d.addWord("bad"); d.addWord("dad"); d.addWord("mad")
precondition(!d.search("pad") && d.search("bad") && d.search(".ad") && d.search("b.."))
precondition(!d.search("b...") && !d.search("..") && !d.search("."))

func matches(_ w: String, _ p: String) -> Bool {
    w.count == p.count && zip(w, p).allSatisfy { $1 == "." || $0 == $1 }
}
for _ in 0..<200 {
    let x = WordDictionary()
    var words = [String]()
    for _ in 0..<20 {
        let w = String((0..<Int.random(in: 1...4)).map { _ in "ab".randomElement()! })
        x.addWord(w); words.append(w)
    }
    for _ in 0..<40 {
        let p = String((0..<Int.random(in: 1...4)).map { _ in "ab.".randomElement()! })
        precondition(x.search(p) == words.contains { matches($0, p) })
    }
}
print("OK")
