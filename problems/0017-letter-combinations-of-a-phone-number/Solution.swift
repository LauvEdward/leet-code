class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        if digits.isEmpty { return [] }
        let keys: [Character: String] = ["2": "abc", "3": "def", "4": "ghi", "5": "jkl",
                                         "6": "mno", "7": "pqrs", "8": "tuv", "9": "wxyz"]
        let d = Array(digits)
        var res = [String]()

        func go(_ i: Int, _ cur: String) {
            if i == d.count {
                res.append(cur)
                return
            }
            for c in keys[d[i]]! {
                go(i + 1, cur + String(c))
            }
        }
        go(0, "")
        return res
    }
}
