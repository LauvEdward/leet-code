func close(_ a: [Double], _ b: [Double]) -> Bool { a.count == b.count && zip(a, b).allSatisfy { abs($0 - $1) < 1e-6 } }

precondition(close(Solution().calcEquation([["a", "b"], ["b", "c"]], [2.0, 3.0],
    [["a", "c"], ["b", "a"], ["a", "e"], ["a", "a"], ["x", "x"]]), [6.0, 0.5, -1.0, 1.0, -1.0]))
precondition(close(Solution().calcEquation([["a", "b"], ["b", "c"], ["bc", "cd"]], [1.5, 2.5, 5.0],
    [["a", "c"], ["c", "b"], ["bc", "cd"], ["cd", "bc"]]), [3.75, 0.4, 5.0, 0.2]))
precondition(close(Solution().calcEquation([["a", "b"]], [0.5], [["a", "b"], ["b", "a"], ["a", "c"], ["x", "y"]]), [0.5, 2.0, -1.0, -1.0]))

// gán giá trị ngẫu nhiên cho các biến, sinh phương trình rồi hỏi lại
for _ in 0..<500 {
    let names = ["a", "b", "c", "d", "e", "f"]
    var val = [String: Double]()
    for v in names { val[v] = Double(Int.random(in: 1...9)) }
    var eqs = [[String]](), vs = [Double](), comp = [String: Int]()
    for v in names { comp[v] = names.firstIndex(of: v)! }
    func root(_ x: String) -> Int { var r = comp[x]!; while comp[names[r]]! != r { r = comp[names[r]]! }; return r }
    for _ in 0..<Int.random(in: 1...5) {
        let x = names.randomElement()!, y = names.randomElement()!
        if x == y { continue }
        eqs.append([x, y]); vs.append(val[x]! / val[y]!)
        comp[names[root(x)]] = root(y)
    }
    if eqs.isEmpty { continue }
    let used = Set(eqs.flatMap { $0 })
    var qs = [[String]](), want = [Double]()
    for x in names { for y in names {
        qs.append([x, y])
        want.append(used.contains(x) && used.contains(y) && root(x) == root(y) ? val[x]! / val[y]! : -1.0)
    } }
    precondition(close(Solution().calcEquation(eqs, vs, qs), want))
}
print("OK")
