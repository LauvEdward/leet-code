class Solution {
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        var left = Set(wordList)
        if !left.contains(endWord) { return 0 }
        let letters = Array("abcdefghijklmnopqrstuvwxyz")

        // BFS theo tầng; len = số từ trong chuỗi biến đổi
        var cur = [beginWord], len = 1
        while !cur.isEmpty {
            var nxt = [String]()
            for w in cur {
                if w == endWord { return len }
                var a = Array(w)
                for i in 0..<a.count {
                    let old = a[i]
                    for c in letters where c != old {
                        a[i] = c
                        let s = String(a)
                        if left.contains(s) {
                            left.remove(s)   // xóa luôn để không thăm lại
                            nxt.append(s)
                        }
                    }
                    a[i] = old
                }
            }
            cur = nxt
            len += 1
        }
        return 0
    }
}
