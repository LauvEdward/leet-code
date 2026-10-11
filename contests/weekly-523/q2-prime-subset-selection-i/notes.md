---
id: 523002
title: Prime Subset Selection I
slug: prime-subset-selection-i
difficulty: Medium
topics: Weekly Contest 523, Math, Greedy, Number Theory, Sieve
date: 2026-10-11
time: O(n log log n)
space: O(n)
status: Chưa nộp (bài chưa mở ngoài trang contest)
---
## Đề bài
Cho `n ≤ 10⁶` và `s ≤ 10⁹`. Trong các số nguyên tố không vượt `n`, chọn **nhiều số nhất** có thể (mỗi số một lần) sao cho tổng không vượt `s`. Trả về các số đã chọn theo thứ tự tăng (đáp án nào tối ưu cũng được).

## Cơ sở lý thuyết
- **Sàng Eratosthenes**: tìm mọi số nguyên tố `≤ n` trong `O(n log log n)`. Với mỗi số nguyên tố `i`, gạch các bội `i², i² + i, …` (các bội nhỏ hơn `i²` đã bị gạch bởi số nguyên tố nhỏ hơn). Chỉ cần xét `i` tới `√n`.
- **Tham lam "lấy cái rẻ nhất trước"**: muốn chọn nhiều phần tử nhất dưới một ngân sách thì lấy các phần tử nhỏ nhất. Chứng minh bằng **lập luận đổi chỗ**: trong một lời giải tối ưu bất kỳ, thay một phần tử bằng phần tử nhỏ hơn chưa được chọn thì tổng giảm mà số lượng không đổi → luôn tồn tại lời giải tối ưu gồm `k` số nhỏ nhất.

## Hướng xử lý
1. Sàng để có các số nguyên tố `≤ n`.
2. Duyệt từ nhỏ đến lớn, cộng dồn; dừng ngay khi thêm số kế tiếp sẽ vượt `s`.
3. Các số đã lấy vốn theo thứ tự tăng.

## Ý tưởng triển khai
- `n < 2` thì không có số nguyên tố nào → trả mảng rỗng ngay (cũng tránh khoảng `2...n` không hợp lệ trong Swift).
- Sàng viết bằng `while` vì bước nhảy thay đổi; `j` bắt đầu từ `i * i`.
- Dừng bằng `break` chứ không `continue`: các số sau còn lớn hơn nên chắc chắn cũng vượt.
- Test cục bộ: vét cạn mọi tập con với `n ≤ 40` để xác nhận số lượng là lớn nhất.

## Ví dụ chạy từng bước
**Input:** `n = 15`, `s = 15`
**Output:** `[2, 3, 5]` (đề cũng chấp nhận `[3, 5, 7]`, `[2, 3, 7]`, `[2, 5, 7]`)

```
Sàng tới 15: 2, 3, 5, 7, 11, 13
p=2: sum = 0 + 2 = 2   <= 15 → lấy → res = [2]
p=3: sum = 2 + 3 = 5   <= 15 → lấy → res = [2, 3]
p=5: sum = 5 + 5 = 10  <= 15 → lấy → res = [2, 3, 5]
p=7: 10 + 7 = 17 > 15 → dừng
Kết quả: [2, 3, 5]   (3 số — bốn số nhỏ nhất đã có tổng 17 nên không thể hơn)
```

**Input:** `n = 7`, `s = 20` → **Output:** `[2, 3, 5, 7]`

```
2 → 5 → 10 → 17, tất cả <= 20, hết số nguyên tố → lấy cả bốn
```

**Input:** `n = 5`, `s = 1` → **Output:** `[]` (số nguyên tố nhỏ nhất là 2 đã vượt `s`).

## Ghi nhớ
"Chọn nhiều phần tử nhất với tổng bị chặn" → sắp tăng rồi lấy dần. Bản II đổi mục tiêu thành "tổng lớn nhất" thì tham lam hết đúng, phải dùng knapsack.
