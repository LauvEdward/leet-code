class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var groups = [String: [String]]()
        for s in strs {
            groups[String(s.sorted()), default: []].append(s)
        }
        return Array(groups.values)
    }
}
