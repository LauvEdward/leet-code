---
id: 105
title: Construct Binary Tree from Preorder and Inorder Traversal
slug: construct-binary-tree-from-preorder-and-inorder-traversal
difficulty: Medium
topics: Binary Tree General, Divide and Conquer, Hash Table
date: 2026-10-20
time: O(n)
space: O(n)
status: Chưa nộp (LeetCode trong Chrome chưa đăng nhập)
---
## Đề bài
Cho dãy duyệt tiền thứ tự (`preorder`) và trung thứ tự (`inorder`) của một cây nhị phân có các giá trị khác nhau. Dựng lại cây.

## Cơ sở lý thuyết
- **Tiền thứ tự** (gốc, trái, phải): phần tử đầu tiên luôn là **gốc**.
- **Trung thứ tự** (trái, gốc, phải): vị trí của gốc chia dãy thành **cây con trái** (bên trái gốc) và **cây con phải** (bên phải).
- **Chia để trị**: tìm gốc → tách đoạn inorder → dựng đệ quy hai cây con. Nếu dựng cây con trái trước rồi mới tới cây con phải, các gốc được tiêu thụ đúng theo thứ tự của `preorder` — nên chỉ cần một con trỏ chạy dọc `preorder`.
- Bảng băm `giá trị → vị trí trong inorder` để tìm gốc `O(1)` (giá trị khác nhau nên ánh xạ duy nhất).

## Hướng xử lý
1. Ghi `pos[v]` cho mọi giá trị trong `inorder`; con trỏ `i = 0` trên `preorder`.
2. `build(lo, hi)` dựng cây cho đoạn `inorder[lo...hi]`:
   - `lo > hi` → `nil`.
   - Gốc là `preorder[i]`, tăng `i`; `m = pos[gốc]`.
   - Con trái = `build(lo, m - 1)`, rồi con phải = `build(m + 1, hi)`.

## Ý tưởng triển khai
- Lưu `pre`, `pos`, `i` thành thuộc tính của lớp để hàm đệ quy dùng chung, khỏi truyền qua tham số.
- Không cắt mảng con (tốn `O(n)` mỗi lần) — chỉ truyền chỉ số `lo`, `hi`.
- Test cục bộ: sinh cây ngẫu nhiên với giá trị khác nhau, lấy hai dãy duyệt rồi dựng lại và so.

## Ví dụ chạy từng bước
**Input:** `preorder = [3, 9, 20, 15, 7]`, `inorder = [9, 3, 15, 20, 7]`
**Output:** `[3, 9, 20, null, null, 15, 7]`

```
pos = {9: 0, 3: 1, 15: 2, 20: 3, 7: 4}

build(0, 4): gốc = pre[0] = 3, m = 1
   trái  build(0, 0): gốc = pre[1] = 9, m = 0
            build(0, -1) = nil, build(1, 0) = nil
   phải  build(2, 4): gốc = pre[2] = 20, m = 3
            trái  build(2, 2): gốc = pre[3] = 15 (lá)
            phải  build(4, 4): gốc = pre[4] = 7  (lá)
```

**Input:** `preorder = [-1]`, `inorder = [-1]` → **Output:** `[-1]`

## Ghi nhớ
Dựng cây từ hai dãy duyệt: dãy tiền/hậu thứ tự cho **gốc**, dãy trung thứ tự cho **ranh giới trái/phải**. Bài 106 giống hệt nhưng đọc hậu thứ tự từ cuối và dựng con phải trước.
