---
id: 101
title: Symmetric Tree
slug: symmetric-tree
difficulty: Easy
topics: Binary Tree General, DFS, BFS
date: 2026-10-20
time: O(n)
space: O(h)
status: Chưa nộp (LeetCode trong Chrome chưa đăng nhập)
---
## Đề bài
Kiểm tra cây nhị phân có đối xứng qua trục dọc đi qua gốc không (cây con trái là ảnh gương của cây con phải).

## Cơ sở lý thuyết
- Hai cây `A`, `B` là **ảnh gương** của nhau khi: gốc bằng nhau, `A.left` là ảnh gương của `B.right`, và `A.right` là ảnh gương của `B.left`. So với bài 100 (Same Tree), chỉ khác là ghép **chéo**.
- Cây đối xứng ⟺ hai cây con của gốc là ảnh gương của nhau.

## Hướng xử lý
1. Gọi `mirror(root.left, root.right)`.
2. `mirror(a, b)`: cả hai `nil` → đúng; một bên `nil` → sai; ngược lại so giá trị, rồi `mirror(a.left, b.right) && mirror(a.right, b.left)`.

## Ý tưởng triển khai
- `root?.left`, `root?.right` — với gốc `nil` cả hai là `nil` → đối xứng (đề luôn có ít nhất 1 nút, nhưng code vẫn an toàn).
- Test cục bộ: so với việc lật cây (như bài 226) rồi so mảng theo tầng.

## Ví dụ chạy từng bước
**Input:** `root = [1, 2, 2, 3, 4, 4, 3]`
**Output:** `true`

```
mirror(2a, 2b): 2 == 2 ✓
   mirror(2a.left = 3, 2b.right = 3): 3 == 3, các con đều nil ✓
   mirror(2a.right = 4, 2b.left = 4): 4 == 4, các con đều nil ✓
→ true
```

**Input:** `root = [1, 2, 2, null, 3, null, 3]`
**Output:** `false`

```
mirror(2a, 2b): 2 == 2 ✓
   mirror(2a.left = nil, 2b.right = 3) → một bên rỗng → false
```

## Ghi nhớ
Đối xứng = so cây với ảnh gương của chính nó → đệ quy trên cặp nút, ghép ngoài với ngoài, trong với trong.
