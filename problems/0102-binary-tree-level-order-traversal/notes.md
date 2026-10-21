---
id: 102
title: Binary Tree Level Order Traversal
slug: binary-tree-level-order-traversal
difficulty: Medium
topics: Binary Tree BFS
date: 2026-10-21
time: O(n)
space: O(w)
status: Chưa nộp (LeetCode trong Chrome chưa đăng nhập)
---
## Đề bài
Trả về giá trị các nút theo từng tầng, mỗi tầng từ trái sang phải.

## Cơ sở lý thuyết
- **Duyệt theo chiều rộng (BFS)**: thăm hết các nút ở khoảng cách `d` từ gốc rồi mới tới khoảng cách `d + 1`. Trên cây, "khoảng cách từ gốc" chính là tầng.
- Cách cài phổ biến dùng một hàng đợi và đếm kích thước tầng trước mỗi vòng; ở đây dùng hai mảng `cur`/`nxt` — ranh giới tầng tự nhiên hơn và tránh việc xóa đầu mảng (`removeFirst` là `O(n)` trong Swift).

## Hướng xử lý
1. `cur = [root]` (nếu khác `nil`).
2. Chừng nào `cur` không rỗng: ghi giá trị của `cur`; gom con trái rồi con phải của mỗi nút vào `nxt`; `cur = nxt`.

## Ý tưởng triển khai
- `cur.map { $0.val }` lấy giá trị cả tầng một dòng.
- Đây là khuôn dùng lại cho các bài 103, 199, 637, 117.

## Ví dụ chạy từng bước
**Input:** `root = [3, 9, 20, null, null, 15, 7]`
**Output:** `[[3], [9, 20], [15, 7]]`

```
cur = [3]      → ghi [3]       nxt = [9, 20]
cur = [9, 20]  → ghi [9, 20]   nxt = [15, 7]   (9 không có con)
cur = [15, 7]  → ghi [15, 7]   nxt = []
cur rỗng → dừng
```

**Input:** `root = []` → **Output:** `[]`

## Ghi nhớ
BFS theo tầng là khuôn nền của cả nhóm "Binary Tree BFS". Trong Swift ưu tiên hai mảng luân phiên thay cho `removeFirst()`.
