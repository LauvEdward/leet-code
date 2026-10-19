class Solution {
    func isValid(_ s: String) -> Bool {
        let pair: [Character: Character] = [")": "(", "]": "[", "}": "{"]
        var st = [Character]()
        for c in s {
            if let open = pair[c] {
                // ngoặc đóng phải khớp ngoặc mở gần nhất
                if st.popLast() != open { return false }
            } else {
                st.append(c)
            }
        }
        return st.isEmpty
    }
}
