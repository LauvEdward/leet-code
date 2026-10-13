---
id: 11
title: Container With Most Water
slug: container-with-most-water
difficulty: Medium
topics: Two Pointers, Array, Greedy
date: 2026-10-13
time: O(n)
space: O(1)
status: Accepted
---
## Đề bài
Có `n` vạch thẳng đứng, vạch `i` cao `height[i]`. Chọn hai vạch cùng trục hoành tạo thành bình chứa được nhiều nước nhất; trả về lượng nước đó.

## Cơ sở lý thuyết
- Diện tích với hai vạch `l < r` là `min(height[l], height[r]) × (r - l)` — bị giới hạn bởi vạch **thấp hơn**.
- **Hai con trỏ với lập luận loại bỏ**: bắt đầu với bề rộng lớn nhất. Giả sử `height[l] < height[r]`. Mọi cặp `(l, r')` với `r' < r` đều hẹp hơn và chiều cao vẫn không vượt `height[l]` → không thể tốt hơn cặp hiện tại. Vậy vạch `l` đã cho kết quả tốt nhất của nó → loại `l`.
- Mỗi bước loại một vạch nên tổng cộng `O(n)`, thay cho `O(n²)` khi thử mọi cặp.

## Hướng xử lý
1. `l = 0`, `r = n - 1`.
2. Cập nhật đáp án bằng diện tích của cặp hiện tại.
3. Tiến con trỏ ở vạch thấp hơn vào trong.
4. Dừng khi hai con trỏ gặp nhau.

## Ý tưởng triển khai
- Khi hai vạch bằng nhau, tiến bên nào cũng đúng (cả hai đều đã đạt tốt nhất của mình); code tiến `r`.
- Test cục bộ đối chiếu với vét cạn mọi cặp.

## Ví dụ chạy từng bước
**Input:** `height = [1, 8, 6, 2, 5, 4, 8, 3, 7]`
**Output:** `49`

```
l=0 (1), r=8 (7): min 1 × 8 = 8     best=8    1 < 7 → l=1
l=1 (8), r=8 (7): min 7 × 7 = 49    best=49   8 < 7 sai → r=7
l=1 (8), r=7 (3): min 3 × 6 = 18    best=49   → r=6
l=1 (8), r=6 (8): min 8 × 5 = 40    best=49   8 < 8 sai → r=5
l=1 (8), r=5 (4): min 4 × 4 = 16    best=49   → r=4
l=1 (8), r=4 (5): min 5 × 3 = 15    best=49   → r=3
l=1 (8), r=3 (2): min 2 × 2 = 4     best=49   → r=2
l=1 (8), r=2 (6): min 6 × 1 = 6     best=49   → r=1
l == r → dừng, trả về 49
```

**Input:** `height = [1, 1]` → **Output:** `1` (`min(1, 1) × 1`).

## Ghi nhớ
Khác bài 42 (hứng nước mưa — tổng nước trên mọi cột), bài này chỉ chọn **hai vạch**. Điểm chung: luôn xử lý/loại bên thấp hơn, vì bên thấp là bên quyết định.
