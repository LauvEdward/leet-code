class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        var res = [String]()

        func go(_ cur: String, _ open: Int, _ close: Int) {
            if cur.count == 2 * n {
                res.append(cur)
                return
            }
            if open < n { go(cur + "(", open + 1, close) }
            // chỉ đóng khi còn ngoặc mở chưa đóng
            if close < open { go(cur + ")", open, close + 1) }
        }
        go("", 0, 0)
        return res
    }
}
