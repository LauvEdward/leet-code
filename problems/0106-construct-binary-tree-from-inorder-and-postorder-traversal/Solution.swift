class Solution {
    var post = [Int]()
    var pos = [Int: Int]()   // giá trị -> vị trí trong inorder
    var i = 0                // đọc postorder từ cuối về

    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        post = postorder
        i = postorder.count - 1
        for (k, v) in inorder.enumerated() { pos[v] = k }
        return build(0, inorder.count - 1)
    }

    func build(_ lo: Int, _ hi: Int) -> TreeNode? {
        if lo > hi { return nil }
        let v = post[i]
        i -= 1
        let m = pos[v]!
        let node = TreeNode(v)
        // đọc ngược postorder là gốc → phải → trái, nên dựng bên phải trước
        node.right = build(m + 1, hi)
        node.left = build(lo, m - 1)
        return node
    }
}
