class Solution {
    func romanToInt(_ s: String) -> Int {
        let val: [Character: Int] = ["I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000]
        let a = Array(s)
        var res = 0

        for i in 0..<a.count {
            let v = val[a[i]]!
            // ký hiệu nhỏ đứng trước ký hiệu lớn thì bị trừ
            if i + 1 < a.count && v < val[a[i + 1]]! {
                res -= v
            } else {
                res += v
            }
        }
        return res
    }
}
