class Solution {
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        return build(nums, 0, nums.count - 1)
    }

    // lấy phần tử giữa làm gốc để hai bên lệch nhau tối đa 1
    func build(_ a: [Int], _ lo: Int, _ hi: Int) -> TreeNode? {
        if lo > hi { return nil }
        let mid = (lo + hi) / 2
        return TreeNode(a[mid], build(a, lo, mid - 1), build(a, mid + 1, hi))
    }
}
