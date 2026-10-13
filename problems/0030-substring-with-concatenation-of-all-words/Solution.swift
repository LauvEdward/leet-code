class Solution {
    func findSubstring(_ s: String, _ words: [String]) -> [Int] {
        let a = Array(s)
        let L = words[0].count, k = words.count
        var need = [String: Int]()
        for w in words { need[w, default: 0] += 1 }
        var res = [Int]()

        // mỗi độ lệch là một dãy các "ô" dài L, trượt cửa sổ trên các ô đó
        for off in 0..<L {
            var l = off, r = off, cnt = 0
            var have = [String: Int]()

            while r + L <= a.count {
                let w = String(a[r..<r + L])
                r += L

                if need[w] == nil {
                    // từ lạ: bỏ hết, bắt đầu lại sau nó
                    have = [:]
                    cnt = 0
                    l = r
                    continue
                }

                have[w, default: 0] += 1
                cnt += 1
                // thừa từ w thì co bên trái tới khi hết thừa
                while have[w]! > need[w]! {
                    let lw = String(a[l..<l + L])
                    have[lw]! -= 1
                    cnt -= 1
                    l += L
                }
                if cnt == k { res.append(l) }
            }
        }
        return res
    }
}
