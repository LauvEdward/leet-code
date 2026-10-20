class BSTIterator {
    var st = [TreeNode]()

    init(_ root: TreeNode?) {
        pushLeft(root)
    }

    // đẩy cả đường đi xuống bên trái: nút nhỏ nhất nằm trên đỉnh
    func pushLeft(_ node: TreeNode?) {
        var n = node
        while let x = n {
            st.append(x)
            n = x.left
        }
    }

    func next() -> Int {
        let x = st.removeLast()
        pushLeft(x.right)
        return x.val
    }

    func hasNext() -> Bool {
        return !st.isEmpty
    }
}
