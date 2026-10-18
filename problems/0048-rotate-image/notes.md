---
id: 48
title: Rotate Image
slug: rotate-image
difficulty: Medium
topics: Matrix, Math
date: 2026-10-18
time: O(n²)
space: O(1)
status: Chưa nộp (LeetCode trong Chrome chưa đăng nhập)
---
## Đề bài
Xoay ma trận vuông `n × n` 90 độ theo chiều kim đồng hồ, **tại chỗ** (không dùng ma trận thứ hai).

## Cơ sở lý thuyết
- Xoay 90 độ theo chiều kim đồng hồ đưa phần tử `(i, j)` tới `(j, n - 1 - i)`.
- **Phân rã thành hai phép đơn giản**:
   - **Chuyển vị** (đối xứng qua đường chéo chính): `(i, j) → (j, i)`.
   - **Đảo mỗi hàng** (đối xứng qua trục dọc): `(j, i) → (j, n - 1 - i)`.
   Ghép lại đúng bằng phép xoay. Cả hai đều làm được tại chỗ bằng cách hoán đổi từng cặp.
- Các biến thể: xoay ngược chiều kim đồng hồ = chuyển vị rồi đảo từng **cột** (hoặc đảo hàng trước rồi chuyển vị); xoay 180 độ = đảo hàng rồi đảo cột.

## Hướng xử lý
1. Chuyển vị: với mọi `i < j`, hoán đổi `matrix[i][j]` và `matrix[j][i]`.
2. Đảo từng hàng.

## Ý tưởng triển khai
- Vòng trong `for j in i + 1..<n` — chỉ đụng nửa trên đường chéo; nếu duyệt cả ma trận, mỗi cặp bị hoán đổi hai lần và trở lại như cũ.
- `matrix[i].reverse()` đảo tại chỗ một hàng.
- Test cục bộ kiểm tra đúng công thức `(i, j) → (j, n - 1 - i)` cho mọi `n` từ 1 đến 7.

## Ví dụ chạy từng bước
**Input:** `matrix = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]`
**Output:** `[[7, 4, 1], [8, 5, 2], [9, 6, 3]]`

```
Ban đầu        Chuyển vị        Đảo từng hàng
1 2 3          1 4 7            7 4 1
4 5 6    →     2 5 8     →      8 5 2
7 8 9          3 6 9            9 6 3

Chuyển vị hoán đổi các cặp: (0,1)↔(1,0): 2↔4 · (0,2)↔(2,0): 3↔7 · (1,2)↔(2,1): 6↔8
Kiểm tra: số 2 ở (0,1) → về (1, 3-1-0) = (1,2) ✓
```

**Input:** `matrix = [[1]]` → **Output:** `[[1]]` (không có cặp nào để hoán đổi).

## Ghi nhớ
Phép biến đổi hình học khó làm tại chỗ → tách thành tích của các phép đối xứng đơn giản (chuyển vị, lật ngang, lật dọc), mỗi phép đều là hoán đổi từng cặp.
