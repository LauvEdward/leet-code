---
id: 637
title: Average of Levels in Binary Tree
slug: average-of-levels-in-binary-tree
difficulty: Easy
topics: Binary Tree BFS
date: 2026-10-21
time: O(n)
space: O(w)
status: Chưa nộp (LeetCode trong Chrome chưa đăng nhập)
---
## Đề bài
Trả về giá trị trung bình của các nút trên từng tầng của cây nhị phân.

## Cơ sở lý thuyết
- **BFS theo tầng** cho đúng tập nút của mỗi tầng; trung bình = tổng / số nút.
- **Tràn số**: giá trị tới `2³¹ - 1`, tổng một tầng có thể vượt 32 bit; `Int` 64 bit của Swift đủ chứa.
- Kết quả là số thực: đổi tổng và số lượng sang `Double` trước khi chia.

## Hướng xử lý
1. Với mỗi tầng: cộng giá trị, đếm số nút, gom tầng sau.
2. Ghi `Double(sum) / Double(count)`.

## Ý tưởng triển khai
- Cộng trong vòng lặp gom tầng sau để chỉ duyệt mỗi tầng một lần.
- Test cục bộ: so sánh với sai số `1e-9`, có ca giá trị bằng `2147483647` để kiểm tra không tràn.

## Ví dụ chạy từng bước
**Input:** `root = [3, 9, 20, null, null, 15, 7]`
**Output:** `[3.0, 14.5, 11.0]`

```
Tầng [3]:      tổng 3,  1 nút → 3 / 1  = 3.0
Tầng [9, 20]:  tổng 29, 2 nút → 29 / 2 = 14.5
Tầng [15, 7]:  tổng 22, 2 nút → 22 / 2 = 11.0
```

**Input:** `root = [2147483647, 2147483647, 2147483647]` → **Output:** `[2147483647.0, 2147483647.0]` (tổng tầng 2 là `4294967294`, vừa `Int` 64 bit).

## Ghi nhớ
Bài thống kê theo tầng → BFS; nhớ kiểm tra tràn số khi cộng dồn và đổi kiểu trước khi chia.
