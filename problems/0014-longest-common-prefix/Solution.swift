class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        var p = strs[0]
        for s in strs {
            while !s.hasPrefix(p) {
                p.removeLast()
            }
        }
        return p
    }
}
