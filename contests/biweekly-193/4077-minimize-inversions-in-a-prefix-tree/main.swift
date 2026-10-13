import Foundation

func check(_ words: [String], _ target: [Int], _ want: Int, line: UInt = #line) {
    let got = Solution().minInversions(words, target)
    precondition(got == want, "line \(line): \(words) \(target): got \(got), want \(want)")
}

func perms(_ a: [String]) -> [[String]] {
    if a.count <= 1 { return [a] }
    var out = [[String]]()
    for i in 0..<a.count {
        var rest = a
        let x = rest.remove(at: i)
        for p in perms(rest) { out.append([x] + p) }
    }
    return out
}

// Vét cạn: sinh mọi thứ tự duyệt có thể của cây tiền tố
func traversals(_ prefix: String, _ words: [String]) -> [[String]] {
    let own = words.contains(prefix) ? [prefix] : []
    let nexts = Array(Set(words.filter { $0.count > prefix.count && $0.hasPrefix(prefix) }
        .map { String($0.prefix(prefix.count + 1)) }))
    if nexts.isEmpty { return [own] }
    var out = [[String]]()
    for order in perms(nexts) {
        var partial: [[String]] = [own]
        for child in order {
            var next = [[String]]()
            for t in traversals(child, words) {
                for p in partial { next.append(p + t) }
            }
            partial = next
        }
        out += partial
    }
    return out
}

func brute(_ words: [String], _ target: [Int]) -> Int {
    var pos = [String: Int]()
    for (i, t) in target.enumerated() { pos[words[t]] = i }
    var best = Int.max
    for t in traversals("", words) {
        let p = t.map { pos[$0]! }
        var inv = 0
        for a in 0..<p.count { for b in a + 1..<p.count where p[a] > p[b] { inv += 1 } }
        best = min(best, inv)
    }
    return best
}

check(["bad", "bag", "fig", "fed"], [3, 1, 0, 2], 2)
check(["ab", "ac", "ba", "bc"], [0, 3, 1, 2], 1)
check(["a"], [0], 0)
check(["a", "ab", "abc"], [2, 1, 0], 3)

for _ in 0..<1500 {
    var set = Set<String>()
    let n = Int.random(in: 1...6)
    while set.count < n {
        let len = Int.random(in: 1...3)
        set.insert(String((0..<len).map { _ in "abc".randomElement()! }))
    }
    let words = Array(set).shuffled()
    let target = Array(0..<n).shuffled()
    check(words, target, brute(words, target))
}

// kích thước lớn: cây 10 nhánh đầy đủ sâu 4 = 10^4 từ
var bigWords = [String]()
let letters = Array("abcdefghij")
for a in letters { for b in letters { for c in letters { for d in letters {
    bigWords.append(String([a, b, c, d]))
} } } }
let t0 = Date()
_ = Solution().minInversions(bigWords, Array(0..<bigWords.count).shuffled())
precondition(Date().timeIntervalSince(t0) < 5, "quá chậm")
print("OK")
