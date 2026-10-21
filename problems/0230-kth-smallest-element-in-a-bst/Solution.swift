class Solution {
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        var st = [TreeNode]()
        var cur = root
        var k = k
        // duyệt trung thứ tự bằng ngăn xếp, dừng ở phần tử thứ k
        while true {
            while let x = cur {
                st.append(x)
                cur = x.left
            }
            let x = st.removeLast()
            k -= 1
            if k == 0 { return x.val }
            cur = x.right
        }
    }
}
