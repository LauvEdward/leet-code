class Solution {
    func flatten(_ root: TreeNode?) {
        var cur = root
        while let c = cur {
            if let l = c.left {
                // nối nhánh phải vào sau nút phải nhất của nhánh trái
                var r = l
                while let x = r.right { r = x }
                r.right = c.right
                c.right = l
                c.left = nil
            }
            cur = c.right
        }
    }
}
