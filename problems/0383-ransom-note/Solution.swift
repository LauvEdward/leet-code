class Solution {
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        var cnt = [Character: Int]()
        for c in magazine { cnt[c, default: 0] += 1 }
        for c in ransomNote {
            cnt[c, default: 0] -= 1
            if cnt[c]! < 0 { return false }
        }
        return true
    }
}
