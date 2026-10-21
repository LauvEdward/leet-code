---
id: 103
title: Binary Tree Zigzag Level Order Traversal
slug: binary-tree-zigzag-level-order-traversal
difficulty: Medium
topics: Binary Tree BFS
date: 2026-10-21
time: O(n)
space: O(w)
status: Chưa nộp (LeetCode trong Chrome chưa đăng nhập)
---
## Đề bài
Như bài 102 nhưng đổi chiều đọc xen kẽ: tầng 0 trái → phải, tầng 1 phải → trái, tầng 2 trái → phải…

## Cơ sở lý thuyết
- **Thứ tự duyệt không đổi**, chỉ đổi thứ tự **ghi**: vẫn gom tầng sau từ trái sang phải như BFS thường, và đảo mảng giá trị ở các tầng lẻ trước khi ghi.
- Nếu cố đổi chiều gom con ở tầng lẻ thì dễ sai, vì thứ tự gom ảnh hưởng tới tầng sau nữa.

## Hướng xử lý
1. BFS theo tầng như bài 102.
2. Tầng chỉ số chẵn ghi nguyên; tầng lẻ ghi bản đảo ngược.

## Ý tưởng triển khai
- Chỉ số tầng hiện tại chính là `res.count` (số tầng đã ghi).
- `vals.reversed()` trả về một view; gán vào biểu thức điều kiện cần cùng kiểu `[Int]` — Swift tự chuyển nhờ ngữ cảnh mảng.

## Ví dụ chạy từng bước
**Input:** `root = [1, 2, 3, 4, 5, 6, 7, 8]`
**Output:** `[[1], [3, 2], [4, 5, 6, 7], [8]]`

```
Tầng 0: [1]          → chẵn → ghi [1]
Tầng 1: [2, 3]       → lẻ   → ghi [3, 2]
Tầng 2: [4, 5, 6, 7] → chẵn → ghi [4, 5, 6, 7]
Tầng 3: [8]          → lẻ   → ghi [8]
(tầng 2 vẫn được gom đúng thứ tự trái → phải vì ta không đổi cách gom)
```

**Input:** `root = [3, 9, 20, null, null, 15, 7]` → **Output:** `[[3], [20, 9], [15, 7]]`

## Ghi nhớ
Biến thể "đổi chiều", "chỉ lấy tầng chẵn"… của BFS: giữ nguyên cách duyệt, chỉ thay đổi cách ghi kết quả.
