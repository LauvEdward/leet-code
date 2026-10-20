---
id: 104
title: Maximum Depth of Binary Tree
slug: maximum-depth-of-binary-tree
difficulty: Easy
topics: Binary Tree General, DFS, BFS
date: 2026-10-20
time: O(n)
space: O(h) (h = chiều cao cây)
status: Chưa nộp (LeetCode trong Chrome chưa đăng nhập)
---
## Đề bài
Tính độ sâu lớn nhất của cây nhị phân: số nút trên đường đi dài nhất từ gốc tới một lá.

## Cơ sở lý thuyết
- **Đệ quy trên cây**: tính chất của cả cây suy ra từ tính chất của hai cây con. Độ sâu của cây = 1 (chính gốc) + độ sâu lớn hơn của hai cây con; cây rỗng có độ sâu 0.
- Đây là **duyệt hậu thứ tự** (DFS): phải biết kết quả hai con trước khi tính cho cha. Cách khác: BFS theo tầng và đếm số tầng.
- Bộ nhớ là độ sâu ngăn xếp đệ quy = chiều cao cây, tệ nhất `O(n)` với cây lệch.

## Hướng xử lý
1. Cây rỗng → `0`.
2. Ngược lại → `1 + max(maxDepth(trái), maxDepth(phải))`.

## Ý tưởng triển khai
- `guard let r = root else { return 0 }` — ca cơ sở một dòng.
- Toàn bộ lời giải là một biểu thức đệ quy.

## Ví dụ chạy từng bước
**Input:** `root = [3, 9, 20, null, null, 15, 7]`
**Output:** `3`

```
      3
     / \
    9   20
       /  \
      15   7

maxDepth(9)  = 1 + max(0, 0) = 1
maxDepth(15) = 1,  maxDepth(7) = 1
maxDepth(20) = 1 + max(1, 1) = 2
maxDepth(3)  = 1 + max(1, 2) = 3
```

**Input:** `root = [1, null, 2]` → **Output:** `2`

## Ghi nhớ
Mẫu đệ quy cơ bản nhất trên cây: "giải hai con, ghép kết quả ở cha". Hầu hết bài cây tiếp theo đều là biến thể của khuôn này.
