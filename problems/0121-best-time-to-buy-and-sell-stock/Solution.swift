class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var lo = Int.max, best = 0
        for p in prices {
            lo = min(lo, p)
            best = max(best, p - lo)
        }
        return best
    }
}
