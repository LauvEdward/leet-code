class Solution {
    func calculate(_ s: String) -> Int {
        var res = 0, num = 0, sign = 1
        var st = [Int]()   // lưu (res, sign) trước mỗi dấu "("

        for c in s {
            if let d = c.wholeNumberValue {
                num = num * 10 + d
            } else if c == "+" || c == "-" {
                res += sign * num
                num = 0
                sign = c == "+" ? 1 : -1
            } else if c == "(" {
                st.append(res)
                st.append(sign)
                res = 0
                sign = 1
            } else if c == ")" {
                res += sign * num
                num = 0
                res *= st.removeLast()   // dấu đứng trước "("
                res += st.removeLast()   // kết quả trước "("
            }
        }
        return res + sign * num
    }
}
