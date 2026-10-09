class Solution {
    func canTransform(_ source: [Int], _ target: [Int]) -> Bool {
        return source.reduce(0, +) == target.reduce(0, +)
    }
}
