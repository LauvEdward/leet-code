class Solution {
    func minQueenMoves(_ source: [Int], _ target: [Int]) -> Int {
        let dr = abs(source[0] - target[0])
        let dc = abs(source[1] - target[1])

        if dr == 0 && dc == 0 { return 0 }
        if dr == 0 || dc == 0 || dr == dc { return 1 }
        return 2
    }
}
