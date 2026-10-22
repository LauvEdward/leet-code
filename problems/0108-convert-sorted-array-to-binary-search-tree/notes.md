---
id: 108
title: Convert Sorted Array to Binary Search Tree
slug: convert-sorted-array-to-binary-search-tree
difficulty: Easy
topics: Divide & Conquer, Binary Search Tree, Binary Tree
date: 2026-10-22
time: O(n)
space: O(log n)
status: Chưa nộp (LeetCode trong Chrome chưa đăng nhập)
---
## Đề bài
Biến mảng đã sắp tăng thành một cây nhị phân tìm kiếm **cân bằng độ cao** (hai cây con của mọi nút lệch nhau tối đa 1 tầng).

## Cơ sở lý thuyết
- Duyệt trung thứ tự BST cho dãy tăng, nên mọi cách chọn gốc tại `a[mid]` rồi dựng đệ quy hai nửa đều cho một BST đúng.
- **Chia để trị**: chọn **phần tử giữa** làm gốc → hai nửa có số phần tử chênh nhau tối đa 1 → hai cây con có độ cao chênh nhau tối đa 1 → cân bằng.
- Độ cao cây là `O(log n)`, đó cũng là độ sâu đệ quy.

## Hướng xử lý
1. `build(lo, hi)`: `lo > hi` → `nil`.
2. `mid = (lo + hi) / 2`; gốc là `a[mid]`, con trái = `build(lo, mid - 1)`, con phải = `build(mid + 1, hi)`.

## Ý tưởng triển khai
- Truyền chỉ số thay vì cắt mảng con.
- `TreeNode(a[mid], trái, phải)` dựng nút trong một dòng nhờ hàm khởi tạo ba tham số.
- Với số phần tử chẵn, chọn phần tử giữa lệch trái hay lệch phải đều đúng; đề chấp nhận mọi đáp án cân bằng.
- Test cục bộ: với `n = 1…64`, kiểm tra duyệt trung thứ tự ra đúng mảng và cây cân bằng ở mọi nút.

## Ví dụ chạy từng bước
**Input:** `nums = [-10, -3, 0, 5, 9]`
**Output:** `[0, -10, 5, null, -3, null, 9]`

```
build(0, 4): mid = 2 → gốc 0
   build(0, 1): mid = 0 → -10
      build(0, -1) = nil
      build(1, 1): mid = 1 → -3
   build(3, 4): mid = 3 → 5
      build(3, 2) = nil
      build(4, 4): mid = 4 → 9

        0
       / \
    -10   5
      \    \
      -3    9
```

**Input:** `nums = [1, 3]` → **Output:** `[1, null, 3]` (mid = 0).

## Ghi nhớ
Dựng cấu trúc cân bằng từ dữ liệu đã sắp → luôn lấy phần tử giữa làm gốc. Bài 109 làm điều tương tự với danh sách liên kết (tìm giữa bằng hai con trỏ).
