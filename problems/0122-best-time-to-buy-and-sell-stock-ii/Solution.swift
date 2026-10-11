class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var res = 0
        for i in 1..<prices.count where prices[i] > prices[i - 1] {
            res += prices[i] - prices[i - 1]
        }
        return res
    }
}
