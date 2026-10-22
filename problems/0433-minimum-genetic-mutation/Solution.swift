class Solution {
    func minMutation(_ startGene: String, _ endGene: String, _ bank: [String]) -> Int {
        var left = Set(bank)
        if !left.contains(endGene) { return -1 }

        // BFS: mỗi bước đổi đúng một ký tự
        var cur = [startGene], steps = 0
        while !cur.isEmpty {
            var nxt = [String]()
            for g in cur {
                if g == endGene { return steps }
                var a = Array(g)
                for i in 0..<a.count {
                    let old = a[i]
                    for c in "ACGT" where c != old {
                        a[i] = c
                        let s = String(a)
                        if left.contains(s) {
                            left.remove(s)
                            nxt.append(s)
                        }
                    }
                    a[i] = old
                }
            }
            cur = nxt
            steps += 1
        }
        return -1
    }
}
