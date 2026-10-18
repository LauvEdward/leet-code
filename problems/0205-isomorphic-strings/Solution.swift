class Solution {
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        let a = Array(s), b = Array(t)
        var st = [Character: Character](), ts = [Character: Character]()

        for i in 0..<a.count {
            // phải ánh xạ 1-1 theo cả hai chiều
            if let x = st[a[i]], x != b[i] { return false }
            if let y = ts[b[i]], y != a[i] { return false }
            st[a[i]] = b[i]
            ts[b[i]] = a[i]
        }
        return true
    }
}
