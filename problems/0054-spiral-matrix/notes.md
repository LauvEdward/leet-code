---
id: 54
title: Spiral Matrix
slug: spiral-matrix
difficulty: Medium
topics: Matrix, Simulation
date: 2026-10-18
time: O(m · n)
space: O(1) phụ (không tính kết quả)
status: Chưa nộp (LeetCode trong Chrome chưa đăng nhập)
---
## Đề bài
Trả về mọi phần tử của ma trận `m × n` theo thứ tự xoắn ốc: đi hết hàng trên sang phải, xuống cột phải, sang trái theo hàng dưới, lên cột trái, rồi lặp lại với phần bên trong.

## Cơ sở lý thuyết
- **Mô phỏng bằng bốn biên** `top`, `bottom`, `left`, `right`: mỗi vòng xoắn đi hết bốn cạnh của hình chữ nhật hiện tại rồi thu hẹp mỗi biên một đơn vị.
- **Cạnh bị suy biến**: khi phần còn lại chỉ là một hàng hoặc một cột, đi "ngược lại" theo cạnh dưới hay cạnh trái sẽ lặp lại phần tử vừa lấy. Vì vậy hai cạnh sau cần kiểm tra biên trước khi đi.
- Cách khác: mô phỏng theo hướng đi và mảng đánh dấu đã thăm (dùng trong test cục bộ) — dễ hiểu nhưng tốn `O(m · n)` bộ nhớ.

## Hướng xử lý
1. Lặp khi `top <= bottom && left <= right`.
2. Hàng `top` từ trái sang phải; `top += 1`.
3. Cột `right` từ trên xuống; `right -= 1`.
4. Nếu còn hàng (`top <= bottom`): hàng `bottom` từ phải sang trái; `bottom -= 1`.
5. Nếu còn cột (`left <= right`): cột `left` từ dưới lên; `left += 1`.

## Ý tưởng triển khai
- Dùng `stride(from:through:by:)` thay cho `a...b` vì khoảng có thể rỗng hoặc đi lùi; `stride` với cận "sai chiều" chỉ cho dãy rỗng, còn `a...b` với `a > b` sẽ crash.
- Test cục bộ: so với bản mô phỏng hướng đi cho mọi kích thước từ 1×1 đến 6×6.

## Ví dụ chạy từng bước
**Input:** `matrix = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]`
**Output:** `[1, 2, 3, 6, 9, 8, 7, 4, 5]`

```
Vòng 1: top=0, bottom=2, left=0, right=2
   hàng 0 trái → phải:  1, 2, 3        top = 1
   cột 2 trên → dưới:   6, 9           right = 1
   1 <= 2 → hàng 2 phải → trái: 8, 7   bottom = 1
   0 <= 1 → cột 0 dưới → trên:  4      left = 1
Vòng 2: top=1, bottom=1, left=1, right=1
   hàng 1 trái → phải:  5              top = 2
   cột 1 từ 2 xuống 1:  (rỗng)         right = 0
   2 <= 1 sai → bỏ cạnh dưới
   1 <= 0 sai → bỏ cạnh trái
Điều kiện vòng lặp sai → dừng
```

**Input:** `matrix = [[1], [2], [3]]` — ca cho thấy vì sao cần kiểm tra biên
**Output:** `[1, 2, 3]`

```
top=0, bottom=2, left=0, right=0
   hàng 0: 1                           top = 1
   cột 0 từ 1 xuống 2: 2, 3            right = -1
   1 <= 2 → hàng 2 từ -1 về 0: (rỗng)  bottom = 1
   0 <= -1 sai → bỏ cạnh trái (nếu không kiểm tra sẽ lấy lại 2)
Dừng vì left > right
```

## Ghi nhớ
Duyệt xoắn ốc / theo lớp → bốn biên thu hẹp dần, và **kiểm tra lại biên** trước hai cạnh đi ngược. Cùng khuôn với bài 59 (điền ma trận xoắn ốc).
