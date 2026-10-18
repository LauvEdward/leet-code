class Solution {
    func minWindow(_ s: String, _ t: String) -> String {
        let a = Array(s)
        var need = [Character: Int]()
        for c in t { need[c, default: 0] += 1 }

        var missing = t.count   // còn thiếu bao nhiêu ký tự của t
        var l = 0, bestL = 0, bestLen = Int.max

        for r in 0..<a.count {
            let c = a[r]
            if need[c, default: 0] > 0 { missing -= 1 }
            need[c, default: 0] -= 1

            // đủ rồi thì co trái hết mức có thể
            while missing == 0 {
                if r - l + 1 < bestLen {
                    bestLen = r - l + 1
                    bestL = l
                }
                need[a[l]]! += 1
                if need[a[l]]! > 0 { missing += 1 }
                l += 1
            }
        }
        return bestLen == Int.max ? "" : String(a[bestL..<bestL + bestLen])
    }
}
