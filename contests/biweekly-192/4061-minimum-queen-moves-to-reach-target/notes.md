---
id: 4061
title: Minimum Queen Moves to Reach Target
slug: minimum-queen-moves-to-reach-target
difficulty: Easy
topics: Biweekly Contest 192, Math, Chess
date: 2026-10-09
time: O(1)
space: O(1)
status: Accepted
---
## Đề bài
Trên bàn cờ 8×8 trống, quân hậu ở ô `source`, cần tới ô `target`. Mỗi nước hậu đi một hay nhiều ô theo hàng, cột hoặc đường chéo. Tìm số nước ít nhất.

## Cơ sở lý thuyết
- **Hình học bàn cờ**: hai ô cùng hàng khi `Δhàng = 0`, cùng cột khi `Δcột = 0`, cùng đường chéo khi `|Δhàng| = |Δcột|`.
- **Chặn trên bằng lập luận**: trên bàn cờ trống, hậu (thực ra chỉ cần xe) luôn tới được mọi ô trong **tối đa 2 nước** — đi ngang tới đúng cột rồi đi dọc tới đúng hàng.
- Khi đáp án chỉ nhận vài giá trị nhỏ, bài toán "tìm đường ngắn nhất" suy biến thành **phân loại trường hợp**, không cần BFS.

## Hướng xử lý
1. Trùng ô → `0`.
2. Cùng hàng, cùng cột hoặc cùng đường chéo → `1`.
3. Còn lại → `2` (luôn làm được, theo lập luận ở trên).

## Ý tưởng triển khai
- Tính `dr = |sr - tr|`, `dc = |sc - tc|`, rồi ba câu `if`.
- Test cục bộ: chạy BFS thật trên bàn 8×8 cho **toàn bộ** `64 × 64` cặp ô và so với công thức.

## Ghi nhớ
Trước khi viết BFS, hỏi "đáp án lớn nhất có thể là bao nhiêu?". Nếu bị chặn bởi hằng số nhỏ thì chỉ cần xét từng trường hợp. So sánh: mã cần BFS thật, tượng thì `0/1/2` hoặc không tới được (khác màu ô), xe và hậu luôn `≤ 2`.
