class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        let h = Array(haystack.utf8), n = Array(needle.utf8)
        if n.count > h.count { return -1 }

        for i in 0...(h.count - n.count) {
            if h[i..<i + n.count].elementsEqual(n) {
                return i
            }
        }
        return -1
    }
}
