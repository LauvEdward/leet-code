---
id: 42
title: Trapping Rain Water
slug: trapping-rain-water
difficulty: Hard
topics: Array / String, Two Pointers, Dynamic Programming, Stack
date: 2026-10-13
time: O(n)
space: O(1)
status: Accepted
---
## Đề bài
`height[i]` là chiều cao cột thứ `i` (mỗi cột rộng 1). Tính lượng nước đọng lại giữa các cột sau cơn mưa.

## Cơ sở lý thuyết
- **Nước trên một cột** chỉ phụ thuộc hai con số: cột cao nhất bên trái và cột cao nhất bên phải. Mực nước tại `i` là `min(maxTrái, maxPhải)`, lượng nước là mực nước trừ `height[i]`.
- Cách trực tiếp: tính sẵn hai mảng `maxTrái`, `maxPhải` (`O(n)` bộ nhớ) — cùng họ "trái × phải" với bài 238.
- **Hai con trỏ** nén bộ nhớ về `O(1)` nhờ nhận xét: nếu `height[l] < height[r]` thì bên phải của `l` chắc chắn có cột cao ít nhất bằng `height[r]`, tức cao hơn `lmax` hiện tại hoặc ít nhất không thấp hơn `height[l]`. Do đó mực nước tại `l` do **`lmax` quyết định**, không cần biết chính xác `maxPhải`.

## Hướng xử lý
1. Hai con trỏ `l`, `r` ở hai đầu; `lmax`, `rmax` là cột cao nhất đã gặp ở mỗi phía.
2. Mỗi bước xử lý bên có cột **thấp hơn**: cập nhật max của phía đó, cộng `max - height` vào kết quả, rồi tiến con trỏ vào trong.
3. Dừng khi hai con trỏ gặp nhau.

## Ý tưởng triển khai
- Cập nhật `lmax` **trước** khi cộng: nếu cột hiện tại là cột cao nhất thì `lmax - height[l] = 0`, không bao giờ ra số âm.
- Khi hai cột bằng nhau, xử lý bên nào cũng đúng; code đi nhánh `else` (bên phải).
- Test cục bộ đối chiếu với công thức `min(maxTrái, maxPhải) - height[i]` tính thẳng cho từng cột.

## Ví dụ chạy từng bước
**Input:** `height = [4, 2, 0, 3, 2, 5]`
**Output:** `9`

```
l=0 (4), r=5 (5): 4 < 5 → lmax = 4, nước += 4 - 4 = 0   res = 0   l=1
l=1 (2), r=5 (5): 2 < 5 → lmax = 4, nước += 4 - 2 = 2   res = 2   l=2
l=2 (0), r=5 (5): 0 < 5 → lmax = 4, nước += 4 - 0 = 4   res = 6   l=3
l=3 (3), r=5 (5): 3 < 5 → lmax = 4, nước += 4 - 3 = 1   res = 7   l=4
l=4 (2), r=5 (5): 2 < 5 → lmax = 4, nước += 4 - 2 = 2   res = 9   l=5
l == r → dừng, trả về 9
```

**Input:** `height = [0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1]`
**Output:** `6`

```
l=0 (0), r=11 (1): 0 < 1  → lmax=0, +0          res=0   l=1
l=1 (1), r=11 (1): 1 < 1 sai → rmax=1, +0       res=0   r=10
l=1 (1), r=10 (2): 1 < 2  → lmax=1, +0          res=0   l=2
l=2 (0), r=10 (2): 0 < 2  → lmax=1, +1          res=1   l=3
l=3 (2), r=10 (2): 2 < 2 sai → rmax=2, +0       res=1   r=9
l=3 (2), r=9  (1): sai    → rmax=2, +1          res=2   r=8
l=3 (2), r=8  (2): sai    → rmax=2, +0          res=2   r=7
l=3 (2), r=7  (3): 2 < 3  → lmax=2, +0          res=2   l=4
l=4 (1), r=7  (3): 1 < 3  → lmax=2, +1          res=3   l=5
l=5 (0), r=7  (3): 0 < 3  → lmax=2, +2          res=5   l=6
l=6 (1), r=7  (3): 1 < 3  → lmax=2, +1          res=6   l=7
l == r → dừng, trả về 6
```

## Ghi nhớ
"Giá trị tại `i` = hàm của max bên trái và max bên phải" → hoặc hai mảng tiền tố/hậu tố, hoặc hai con trỏ luôn xử lý bên thấp hơn. Cách thứ ba dùng ngăn xếp đơn điệu (tính nước theo từng lớp ngang) đáng biết cho các bài biến thể.
