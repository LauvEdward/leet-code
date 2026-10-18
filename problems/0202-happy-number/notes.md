---
id: 202
title: Happy Number
slug: happy-number
difficulty: Easy
topics: Hashmap, Math, Two Pointers
date: 2026-10-18
time: O(log n)
space: O(log n)
status: Chưa nộp (LeetCode trong Chrome chưa đăng nhập)
---
## Đề bài
Một số là *vui* nếu lặp lại phép "thay số bằng tổng bình phương các chữ số" thì cuối cùng thu được `1`. Nếu dãy rơi vào một vòng lặp không chứa `1` thì số đó không vui. Kiểm tra `n` có vui không.

## Cơ sở lý thuyết
- **Dãy lặp của một hàm trên tập hữu hạn** chắc chắn rơi vào chu trình. Ở đây, với số có `d` chữ số, tổng bình phương các chữ số không vượt `81·d` — rất nhỏ so với chính số đó khi `d ≥ 4`. Nên dãy nhanh chóng rơi vào khoảng nhỏ và phải lặp lại.
- **Phát hiện chu trình**: lưu các giá trị đã gặp vào tập hợp (dùng ở đây), hoặc thuật toán **Floyd (rùa và thỏ)** với hai con trỏ chạy tốc độ 1 và 2 để chỉ tốn `O(1)` bộ nhớ.
- Số `1` là điểm cố định (`1² = 1`), nên "đạt tới 1" và "rơi vào chu trình chứa 1" là một.

## Hướng xử lý
1. `x = n`, tập `seen` rỗng.
2. Chừng nào `x != 1` và `x` chưa gặp: ghi `x` vào `seen`, thay `x` bằng tổng bình phương các chữ số.
3. Trả về `x == 1`.

## Ý tưởng triển khai
- Tách chữ số bằng `% 10` và `/ 10` (giống bài 7, 9).
- Vòng ngoài dừng khi gặp `1` hoặc gặp lại một số cũ; cả hai đều chắc chắn xảy ra.
- Test cục bộ so với danh sách các số vui nhỏ hơn 50 đã biết.

## Ví dụ chạy từng bước
**Input:** `n = 19`
**Output:** `true`

```
19  → 1² + 9²      = 1 + 81  = 82
82  → 8² + 2²      = 64 + 4  = 68
68  → 6² + 8²      = 36 + 64 = 100
100 → 1² + 0² + 0² = 1
x = 1 → true
```

**Input:** `n = 2`
**Output:** `false`

```
2 → 4 → 16 → 37 → 58 → 89 → 145 → 42 → 20 → 4
4 đã có trong seen → dừng, x = 4 ≠ 1 → false
(chu trình 4 → 16 → 37 → 58 → 89 → 145 → 42 → 20 → 4 không chứa 1)
```

## Ghi nhớ
"Lặp một phép biến đổi, hỏi có tới đích không" → dãy rồi sẽ lặp; phát hiện chu trình bằng tập `seen` hoặc Floyd. Floyd cũng là lõi của bài 141, 142 (chu trình trong danh sách liên kết) và 287.
