class Solution {
    func hIndex(_ citations: [Int]) -> Int {
        let a = citations.sorted(by: >)
        var h = 0
        for i in 0..<a.count where a[i] >= i + 1 {
            h = i + 1
        }
        return h
    }
}
