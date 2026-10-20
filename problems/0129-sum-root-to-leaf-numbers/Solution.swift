class Solution {
    func sumNumbers(_ root: TreeNode?) -> Int {
        return dfs(root, 0)
    }

    func dfs(_ node: TreeNode?, _ cur: Int) -> Int {
        guard let n = node else { return 0 }
        let v = cur * 10 + n.val
        if n.left == nil && n.right == nil { return v }
        return dfs(n.left, v) + dfs(n.right, v)
    }
}
