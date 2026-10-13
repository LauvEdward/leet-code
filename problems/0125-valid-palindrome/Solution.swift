class Solution {
    func isPalindrome(_ s: String) -> Bool {
        let a = s.lowercased().filter { $0.isLetter || $0.isNumber }
        return a == String(a.reversed())
    }
}
