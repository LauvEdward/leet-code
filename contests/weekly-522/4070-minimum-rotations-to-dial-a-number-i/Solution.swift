class Solution {
    func minRotations(_ s: String) -> Int {
        var cur = 0, res = 0
        for c in s {
            let d = abs(c.wholeNumberValue! - cur)
            res += min(d, 10 - d)
            cur = c.wholeNumberValue!
        }
        return res
    }
}
