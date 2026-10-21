---
id: 200
title: Number of Islands
slug: number-of-islands
difficulty: Medium
topics: Graph General, DFS, BFS, Union Find, Matrix
date: 2026-10-21
time: O(m · n)
space: O(m · n)
status: Chưa nộp (LeetCode trong Chrome chưa đăng nhập)
---
## Đề bài
Lưới `m × n` gồm đất (`"1"`) và nước (`"0"`). Đếm số hòn đảo — mỗi đảo là một vùng đất nối nhau theo 4 hướng (trên, dưới, trái, phải).

## Cơ sở lý thuyết
- Coi mỗi ô đất là một **đỉnh**, hai ô đất kề nhau có **cạnh** nối. Số đảo = số **thành phần liên thông** của đồ thị này.
- **Loang (flood fill)**: gặp một ô đất chưa thăm thì đó là một đảo mới; loang từ ô đó (DFS/BFS) để đánh dấu cả đảo, không đếm lại.
- **Đệ quy hay ngăn xếp**: lưới tới `300 × 300` có thể tạo vùng liên thông 90.000 ô; DFS đệ quy khi đó sâu 90.000 tầng và có nguy cơ tràn ngăn xếp. Dùng ngăn xếp tường minh thì an toàn.
- Cách khác: hợp nhất các tập (Union-Find), dùng trong test cục bộ để đối chiếu.

## Hướng xử lý
1. Duyệt mọi ô; gặp `"1"` thì tăng bộ đếm.
2. Đánh dấu ô đó thành `"0"` và đẩy vào ngăn xếp; lấy dần ra, đẩy mọi hàng xóm còn là `"1"` (đánh dấu ngay khi đẩy).
3. Trả về bộ đếm.

## Ý tưởng triển khai
- Làm việc trên bản sao `var g = grid` vì tham số là hằng.
- Đánh dấu **lúc đẩy vào** ngăn xếp (không phải lúc lấy ra) để không đẩy trùng một ô nhiều lần.
- Test cục bộ: so với Union-Find trên 2000 lưới ngẫu nhiên, và chạy thử lưới `300 × 300` toàn đất.

## Ví dụ chạy từng bước
**Input:** `grid = ["11000", "11000", "00100", "00011"]`
**Output:** `3`

```
1 1 0 0 0
1 1 0 0 0
0 0 1 0 0
0 0 0 1 1

(0,0) = 1 → đảo thứ 1, loang: (0,0), (1,0), (0,1), (1,1) → tất cả thành 0
(2,2) = 1 → đảo thứ 2, loang: chỉ (2,2)
(3,3) = 1 → đảo thứ 3, loang: (3,3), (3,4)
Các ô còn lại đều là 0 → kết quả 3
```

**Input:** `grid = ["11110", "11010", "11000", "00000"]` → **Output:** `1` (mọi ô đất nối thành một vùng).

## Ghi nhớ
Đếm vùng trên lưới → loang từ mỗi ô chưa thăm. Với lưới lớn trong Swift, ưu tiên ngăn xếp/hàng đợi tường minh thay cho đệ quy.
