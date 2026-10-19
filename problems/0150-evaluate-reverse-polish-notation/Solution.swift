class Solution {
    func evalRPN(_ tokens: [String]) -> Int {
        var st = [Int]()
        for t in tokens {
            if let v = Int(t) {
                st.append(v)
                continue
            }
            let b = st.removeLast(), a = st.removeLast()
            switch t {
            case "+": st.append(a + b)
            case "-": st.append(a - b)
            case "*": st.append(a * b)
            default: st.append(a / b)   // Swift chia nguyên làm tròn về 0, đúng như đề
            }
        }
        return st[0]
    }
}
