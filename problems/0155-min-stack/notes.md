---
id: 155
title: Min Stack
slug: min-stack
difficulty: Medium
topics: Stack, Design
date: 2026-10-19
time: O(1) mỗi thao tác
space: O(n)
status: Chưa nộp (LeetCode trong Chrome chưa đăng nhập)
---
## Đề bài
Thiết kế ngăn xếp hỗ trợ `push`, `pop`, `top` và `getMin` (lấy phần tử nhỏ nhất hiện có), tất cả đều `O(1)`.

## Cơ sở lý thuyết
- Giá trị nhỏ nhất của ngăn xếp chỉ thay đổi khi `push` hoặc `pop`, và ngăn xếp chỉ thay đổi ở đỉnh. Vì vậy **min của ngăn xếp tại mỗi thời điểm** chỉ phụ thuộc vào trạng thái lúc phần tử đỉnh được đẩy vào.
- **Lưu kèm min tại mỗi tầng**: mỗi phần tử lưu cặp `(giá trị, min của mọi phần tử từ đáy tới nó)`. Khi `pop`, min của tầng bên dưới vẫn còn nguyên — không phải tính lại.
- Cách tiết kiệm hơn: một ngăn xếp phụ chỉ đẩy khi gặp min mới (≤ min hiện tại). Ở đây dùng cặp cho đơn giản.

## Hướng xử lý
1. `push(v)`: đẩy `(v, min(v, min của đỉnh hiện tại))` — nếu ngăn xếp rỗng thì min là `v`.
2. `pop`: bỏ đỉnh.
3. `top`: giá trị ở đỉnh.
4. `getMin`: min lưu ở đỉnh.

## Ý tưởng triển khai
- Mảng tuple có tên `[(val: Int, mn: Int)]`.
- `st.last?.mn ?? value` gộp trường hợp ngăn xếp rỗng.
- Đề đảm bảo `pop`, `top`, `getMin` chỉ được gọi khi ngăn xếp không rỗng nên force-unwrap thoải mái.
- Với bài thiết kế, LeetCode yêu cầu đúng tên lớp `MinStack`.
- Test cục bộ: 20.000 thao tác ngẫu nhiên, so `top` và `getMin` với mảng thường.

## Ví dụ chạy từng bước
**Input:** `push(-2)`, `push(0)`, `push(-3)`, `getMin()`, `pop()`, `top()`, `getMin()`
**Output:** `-3`, `0`, `-2`

```
push(-2): st = [(-2, -2)]
push(0):  min(0, -2) = -2   → st = [(-2, -2), (0, -2)]
push(-3): min(-3, -2) = -3  → st = [(-2, -2), (0, -2), (-3, -3)]
getMin()  → đỉnh là (-3, -3) → -3
pop()     → st = [(-2, -2), (0, -2)]
top()     → 0
getMin()  → -2   (min của tầng dưới được giữ sẵn, không cần tính lại)
```

## Ghi nhớ
Cần truy vấn tổng hợp (min, max…) `O(1)` trên ngăn xếp → mỗi tầng lưu sẵn kết quả tổng hợp tính tới nó. Hai ngăn xếp như vậy ghép lại còn cho ra hàng đợi có `getMin` `O(1)` khấu hao.
