class Solution {
    func wordPattern(_ pattern: String, _ s: String) -> Bool {
        let p = Array(pattern)
        let w = s.split(separator: " ").map(String.init)
        if p.count != w.count { return false }

        var pw = [Character: String](), wp = [String: Character]()
        for i in 0..<p.count {
            if let x = pw[p[i]], x != w[i] { return false }
            if let y = wp[w[i]], y != p[i] { return false }
            pw[p[i]] = w[i]
            wp[w[i]] = p[i]
        }
        return true
    }
}
