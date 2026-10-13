class Solution {
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        let a = Array(s)
        var i = 0
        for c in t where i < a.count && c == a[i] {
            i += 1
        }
        return i == a.count
    }
}
