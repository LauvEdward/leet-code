---
id: 52
title: N-Queens II
slug: n-queens-ii
difficulty: Hard
topics: Backtracking
date: 2026-10-22
time: O(n!)
space: O(n)
status: Chưa nộp (LeetCode trong Chrome chưa đăng nhập)
---
## Đề bài
Đếm số cách đặt `n` quân hậu trên bàn `n × n` sao cho không hai quân nào ăn nhau (cùng hàng, cột hoặc đường chéo).

## Cơ sở lý thuyết
- Mỗi hàng có đúng một hậu → **đặt lần lượt theo hàng**, ràng buộc hàng tự thỏa.
- Ba loại xung đột còn lại kiểm tra `O(1)` bằng ba tập:
   - Cột: `c`.
   - Đường chéo chính (`\`): mọi ô trên cùng một đường có cùng `r - c`.
   - Đường chéo phụ (`/`): cùng `r + c`.
- **Quay lui**: thử từng cột hợp lệ ở hàng hiện tại, đi xuống hàng sau, bỏ đặt khi quay về. Nhánh nào hết cột hợp lệ thì dừng sớm.

## Hướng xử lý
1. `go(r)`: nếu `r == n` → tăng bộ đếm.
2. Với mỗi cột `c` không xung đột: thêm `c`, `r - c`, `r + c` vào ba tập; `go(r + 1)`; gỡ ra.

## Ý tưởng triển khai
- Ba `Set<Int>`; có thể thay bằng mảng `Bool` hoặc bitmask để nhanh hơn, nhưng `n ≤ 9` nên không cần.
- Test cục bộ: so với số lời giải đã biết cho `n = 1…9` (1, 0, 0, 2, 10, 4, 40, 92, 352).

## Ví dụ chạy từng bước
**Input:** `n = 4`
**Output:** `2`

```
Hàng 0 đặt cột 0:
   hàng 1: cột 0 trùng cột, cột 1 trùng chéo (1-1 = 0 = 0-0) → thử cột 2
      hàng 2: cột 0 trùng cột, 1 trùng chéo phụ (2+1 = 3 = 1+2), 2 trùng cột, 3 trùng chéo chính (2-3 = -1 = 1-2) → bế tắc
   hàng 1 thử cột 3:
      hàng 2 đặt cột 1 → hàng 3: không cột nào hợp lệ → bế tắc
   → cột 0 không cho lời giải nào
Hàng 0 đặt cột 1: hàng 1 cột 3 → hàng 2 cột 0 → hàng 3 cột 2 → đếm = 1
   . Q . .
   . . . Q
   Q . . .
   . . Q .
Hàng 0 đặt cột 2: đối xứng với trường hợp trên → đếm = 2
Hàng 0 đặt cột 3: đối xứng với cột 0 → không có
```

**Input:** `n = 1` → **Output:** `1`

## Ghi nhớ
Bài đặt quân không xung đột → đặt theo hàng, kiểm tra cột và hai đường chéo bằng `r - c`, `r + c`. Bài 51 cùng lời giải nhưng ghi lại bàn cờ thay vì đếm.
