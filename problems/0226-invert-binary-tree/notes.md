---
id: 226
title: Invert Binary Tree
slug: invert-binary-tree
difficulty: Easy
topics: Binary Tree General, DFS, BFS
date: 2026-10-20
time: O(n)
space: O(h)
status: Chưa nộp (LeetCode trong Chrome chưa đăng nhập)
---
## Đề bài
Lật cây nhị phân theo gương: tại mọi nút, đổi chỗ con trái và con phải.

## Cơ sở lý thuyết
- Cây lật = gốc giữ nguyên, con trái mới là **cây con phải đã lật**, con phải mới là **cây con trái đã lật**. Định nghĩa đệ quy trực tiếp.
- Thứ tự xử lý không quan trọng (tiền thứ tự, hậu thứ tự hay BFS đều đúng) vì mỗi nút chỉ cần được hoán đổi đúng một lần.

## Hướng xử lý
1. Cây rỗng → `nil`.
2. Lật cây con trái (lưu lại), gán con trái = lật(cây con phải), con phải = cây trái đã lật.
3. Trả về gốc.

## Ý tưởng triển khai
- Phải lưu `l = invertTree(r.left)` **trước** khi ghi đè `r.left`, nếu không sẽ mất cây con trái.
- Cây được sửa tại chỗ, hàm trả về chính gốc.

## Ví dụ chạy từng bước
**Input:** `root = [4, 2, 7, 1, 3, 6, 9]`
**Output:** `[4, 7, 2, 9, 6, 3, 1]`

```
       4                 4
     /   \             /   \
    2     7     →      7     2
   / \   / \          / \   / \
  1   3 6   9        9   6 3   1

invert(2): trái = invert(3) = 3, phải = invert(1) = 1 → 2 có con (3, 1)
invert(7): trái = invert(9) = 9, phải = invert(6) = 6 → 7 có con (9, 6)
invert(4): trái = 7 (đã lật), phải = 2 (đã lật)
```

**Input:** `root = []` → **Output:** `[]`

## Ghi nhớ
Biến đổi cấu trúc cây → đệ quy, nhớ lưu kết quả trung gian trước khi ghi đè con trỏ.
