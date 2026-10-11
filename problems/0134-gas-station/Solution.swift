class Solution {
    func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
        var total = 0, tank = 0, start = 0
        for i in 0..<gas.count {
            let d = gas[i] - cost[i]
            total += d
            tank += d
            if tank < 0 {
                // không trạm nào từ start tới i làm điểm xuất phát được
                start = i + 1
                tank = 0
            }
        }
        return total >= 0 ? start : -1
    }
}
