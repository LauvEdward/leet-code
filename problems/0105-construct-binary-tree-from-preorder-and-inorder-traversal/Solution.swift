class Solution {
    var pre = [Int]()
    var pos = [Int: Int]()   // giá trị -> vị trí trong inorder
    var i = 0                // phần tử kế tiếp của preorder

    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        pre = preorder
        i = 0
        for (k, v) in inorder.enumerated() { pos[v] = k }
        return build(0, inorder.count - 1)
    }

    // dựng cây con ứng với đoạn inorder[lo...hi]
    func build(_ lo: Int, _ hi: Int) -> TreeNode? {
        if lo > hi { return nil }
        let v = pre[i]
        i += 1
        let m = pos[v]!
        let node = TreeNode(v)
        node.left = build(lo, m - 1)
        node.right = build(m + 1, hi)
        return node
    }
}
