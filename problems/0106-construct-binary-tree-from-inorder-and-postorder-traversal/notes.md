---
id: 106
title: Construct Binary Tree from Inorder and Postorder Traversal
slug: construct-binary-tree-from-inorder-and-postorder-traversal
difficulty: Medium
topics: Binary Tree General, Divide and Conquer, Hash Table
date: 2026-10-20
time: O(n)
space: O(n)
status: Chưa nộp (LeetCode trong Chrome chưa đăng nhập)
---
## Đề bài
Cho dãy duyệt trung thứ tự (`inorder`) và hậu thứ tự (`postorder`) của cây nhị phân có giá trị khác nhau. Dựng lại cây.

## Cơ sở lý thuyết
- **Hậu thứ tự** (trái, phải, gốc): phần tử **cuối** là gốc. Đọc ngược từ cuối về đầu ta được thứ tự **gốc, phải, trái**.
- **Trung thứ tự**: vị trí gốc chia đoạn thành cây con trái và phải (như bài 105).
- Vì đọc ngược nên phải dựng **cây con phải trước**, sau đó mới tới cây con trái — để con trỏ trên `postorder` tiêu thụ gốc đúng thứ tự.

## Hướng xử lý
1. Ghi `pos[v]` cho `inorder`; con trỏ `i` bắt đầu ở cuối `postorder`.
2. `build(lo, hi)`:
   - `lo > hi` → `nil`.
   - Gốc là `postorder[i]`, giảm `i`; `m = pos[gốc]`.
   - Con phải = `build(m + 1, hi)`, rồi con trái = `build(lo, m - 1)`.

## Ý tưởng triển khai
- Khác bài 105 đúng hai chỗ: `i` chạy ngược, và thứ tự gọi đệ quy đảo (phải trước trái).
- Test cục bộ giống bài 105 với cặp dãy (inorder, postorder).

## Ví dụ chạy từng bước
**Input:** `inorder = [9, 3, 15, 20, 7]`, `postorder = [9, 15, 7, 20, 3]`
**Output:** `[3, 9, 20, null, null, 15, 7]`

```
pos = {9: 0, 3: 1, 15: 2, 20: 3, 7: 4}, i bắt đầu ở 4

build(0, 4): gốc = post[4] = 3, m = 1
   phải build(2, 4): gốc = post[3] = 20, m = 3
            phải build(4, 4): gốc = post[2] = 7  (lá)
            trái build(2, 2): gốc = post[1] = 15 (lá)
   trái build(0, 0): gốc = post[0] = 9 (lá)
```

Nếu dựng con trái trước, ở bước thứ hai sẽ lấy nhầm `post[3] = 20` làm gốc của đoạn `[9]`.

## Ghi nhớ
Đọc ngược một dãy duyệt thì thứ tự cây con cũng đảo. Hai bài 105/106 là một bài với hai chiều đọc.
