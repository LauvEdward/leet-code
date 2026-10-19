class MinStack {
    var st = [(val: Int, mn: Int)]()   // mỗi phần tử nhớ luôn min tính tới nó

    init() {
    }

    func push(_ value: Int) {
        st.append((value, min(value, st.last?.mn ?? value)))
    }

    func pop() {
        st.removeLast()
    }

    func top() -> Int {
        return st.last!.val
    }

    func getMin() -> Int {
        return st.last!.mn
    }
}
