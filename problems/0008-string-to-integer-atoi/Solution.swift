class Solution {
    func myAtoi(_ s: String) -> Int {
        let a = Array(s)
        var i = 0, sign = 1, res = 0

        while i < a.count && a[i] == " " { i += 1 }

        if i < a.count && (a[i] == "+" || a[i] == "-") {
            if a[i] == "-" { sign = -1 }
            i += 1
        }

        while i < a.count, let d = a[i].wholeNumberValue, a[i].isASCII {
            res = res * 10 + d
            // vượt 32 bit là dừng luôn, khỏi sợ tràn 64 bit
            if res > Int(Int32.max) { break }
            i += 1
        }

        res *= sign
        return min(max(res, Int(Int32.min)), Int(Int32.max))
    }
}
