---
id: 222
title: Count Complete Tree Nodes
slug: count-complete-tree-nodes
difficulty: Medium
topics: Binary Tree General, Binary Search, Bit Manipulation
date: 2026-10-21
time: O(log² n)
space: O(log n)
status: Chưa nộp (LeetCode trong Chrome chưa đăng nhập)
---
## Đề bài
Đếm số nút của một **cây nhị phân hoàn chỉnh** (mọi tầng đầy, trừ tầng cuối được lấp từ trái sang) nhanh hơn `O(n)`.

## Cơ sở lý thuyết
- **Cây hoàn hảo** (perfect, mọi tầng đều đầy) có chiều cao `h` thì có đúng `2^h - 1` nút — tính được ngay, không cần duyệt.
- Trong cây hoàn chỉnh, đo chiều cao theo **mép trái** (đi toàn `left`) và theo **mép phải** (đi toàn `right`): nếu bằng nhau thì cây hoàn hảo.
- Nếu không bằng nhau, tại mỗi nút **ít nhất một** trong hai cây con là cây hoàn hảo (tính `O(1)` sau khi đo), nên chỉ một nhánh phải đi sâu tiếp. Có `O(log n)` tầng đệ quy, mỗi tầng đo chiều cao `O(log n)` → tổng `O(log² n)`.

## Hướng xử lý
1. Cây rỗng → `0`.
2. Đo `lh` (theo mép trái) và `rh` (theo mép phải).
3. `lh == rh` → trả `2^lh - 1`.
4. Ngược lại → `1 + countNodes(trái) + countNodes(phải)`.

## Ý tưởng triển khai
- `(1 << lh) - 1` tính `2^lh - 1` bằng dịch bit.
- Đếm chiều cao bằng hai vòng `while let` ngắn.
- Test cục bộ: dựng cây hoàn chỉnh với mọi số nút từ 0 tới 200 và so.

## Ví dụ chạy từng bước
**Input:** `root = [1, 2, 3, 4, 5, 6]`
**Output:** `6`

```
        1
      /   \
     2     3
    / \   /
   4   5 6

count(1): lh = 3 (1 → 2 → 4), rh = 2 (1 → 3) → khác → 1 + count(2) + count(3)
  count(2): lh = 2 (2 → 4), rh = 2 (2 → 5) → bằng → 2² - 1 = 3
  count(3): lh = 2 (3 → 6), rh = 1 (3)     → khác → 1 + count(6) + count(nil)
     count(6): lh = rh = 1 → 1
     count(nil) = 0
     → 1 + 1 + 0 = 2
  → 1 + 3 + 2 = 6
```

**Input:** `root = []` → **Output:** `0`

## Ghi nhớ
Cấu trúc đặc biệt của dữ liệu (cây hoàn chỉnh, mảng đã sắp…) là gợi ý để vượt qua cận "phải duyệt hết". Ở đây: nhận diện cây con hoàn hảo để đếm bằng công thức.
