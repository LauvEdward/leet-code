class Solution {
    func reverse(_ x: Int) -> Int {
        var x = x, res = 0
        while x != 0 {
            res = res * 10 + x % 10
            x /= 10
        }
        // Int của Swift là 64 bit nên cứ đảo xong rồi mới kiểm tra tràn
        if res > Int(Int32.max) || res < Int(Int32.min) { return 0 }
        return res
    }
}
