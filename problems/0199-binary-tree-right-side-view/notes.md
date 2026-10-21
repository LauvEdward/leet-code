---
id: 199
title: Binary Tree Right Side View
slug: binary-tree-right-side-view
difficulty: Medium
topics: Binary Tree BFS, DFS
date: 2026-10-21
time: O(n)
space: O(w)
status: Chưa nộp (LeetCode trong Chrome chưa đăng nhập)
---
## Đề bài
Đứng ở bên phải cây nhìn sang, liệt kê giá trị các nút nhìn thấy từ trên xuống — tức nút **phải nhất của mỗi tầng**.

## Cơ sở lý thuyết
- **BFS theo tầng**: danh sách nút của mỗi tầng xếp từ trái sang phải; phần tử cuối chính là nút nhìn thấy từ bên phải.
- Nút phải nhất của một tầng **không nhất thiết** nằm ở nhánh phải của gốc: nếu nhánh phải ngắn hơn, ở các tầng sâu ta nhìn thấy nút của nhánh trái.
- Cách DFS tương đương: duyệt phải trước trái, nút **đầu tiên** gặp ở mỗi độ sâu là nút nhìn thấy.

## Hướng xử lý
1. `cur` = tầng hiện tại.
2. Ghi giá trị của `cur.last`.
3. Gom con của mọi nút trong tầng (trái trước phải sau) thành tầng sau.

## Ý tưởng triển khai
- Khuôn BFS hai mảng `cur`/`nxt` giống bài 117 và 102.
- Cây rỗng → vòng lặp không chạy → mảng rỗng.

## Ví dụ chạy từng bước
**Input:** `root = [1, 2, 3, null, 5, null, 4]`
**Output:** `[1, 3, 4]`

```
      1          ← nhìn thấy 1
     / \
    2   3        ← nhìn thấy 3
     \   \
      5   4      ← nhìn thấy 4

Tầng [1]    → ghi 1
Tầng [2, 3] → ghi 3
Tầng [5, 4] → ghi 4
```

**Input:** `root = [1, 2, 3, 4, null, null, null, 5]` → **Output:** `[1, 3, 4, 5]`

```
Tầng [1] → 1 · Tầng [2, 3] → 3 · Tầng [4] → 4 · Tầng [5] → 5
(từ tầng 3 trở xuống chỉ còn nhánh trái, nên nhìn thấy 4 và 5)
```

## Ghi nhớ
"Mỗi tầng một giá trị đại diện" (trái nhất, phải nhất, lớn nhất, trung bình…) → BFS theo tầng rồi lấy đại diện. Bài 637, 102, 103 cùng một khuôn.
