---
id: 193001
title: Maximum Product Pair With Target Sum
slug: maximum-product-pair-with-target-sum
difficulty: Easy
topics: Biweekly Contest 193, Array, Enumeration
date: 2026-10-11
time: O(n²)
space: O(1)
status: Chưa nộp (bài chưa mở ngoài trang contest)
---
## Đề bài
Cho mảng `nums` (`n ≤ 100`) và số `target`. Cặp chỉ số khác nhau `(i, j)` hợp lệ nếu `nums[i] + nums[j] == target` và `nums[i] > nums[j]`. Trả về cặp hợp lệ có tích `nums[i] * nums[j]` lớn nhất, không có thì trả `[-1, -1]`.

## Cơ sở lý thuyết
- **Vét cạn (brute force)**: khi ràng buộc nhỏ (`n ≤ 100` → `10⁴` cặp), thử hết mọi khả năng là cách đúng và nhanh nhất để viết. Đọc ràng buộc trước khi nghĩ thuật toán.
- **Cặp có thứ tự**: điều kiện `nums[i] > nums[j]` làm `(i, j)` khác `(j, i)`, nên phải duyệt cả hai chiều chứ không chỉ `j > i`.
- Ghi chú toán: với tổng cố định `a + b = T`, tích `a·b` lớn nhất khi `a`, `b` gần nhau nhất. Dùng được để tối ưu, nhưng ở đây không cần.

## Hướng xử lý
1. Hai vòng lặp `i`, `j` trên toàn bộ mảng.
2. Với mỗi cặp: kiểm tra tổng bằng `target` và `nums[i] > nums[j]`; nếu tích lớn hơn tích tốt nhất hiện có thì ghi lại.
3. Không cần kiểm tra `i != j` riêng: khi `i == j` thì `nums[i] > nums[j]` sai.

## Ý tưởng triển khai
- `best = Int.min` để tích âm cũng được nhận (ví dụ 2 có đáp án với tích `-2`).
- `res` khởi tạo `[-1, -1]`, chỉ đổi khi tìm được cặp hợp lệ.
- So sánh `>` chặt: nhiều cặp cùng tích thì giữ cặp gặp đầu tiên — đề cho phép trả cặp nào cũng được.

## Ví dụ chạy từng bước
**Input:** `nums = [1, 2, 3, 4]`, `target = 5`
**Output:** `[2, 1]`

```
i=0 (1): j=3 (4): tổng 5 nhưng 1 > 4 sai            → bỏ
i=1 (2): j=2 (3): tổng 5 nhưng 2 > 3 sai            → bỏ
i=2 (3): j=1 (2): tổng 5, 3 > 2 ✓, tích 6 > -∞      → best = 6, res = [2, 1]
i=3 (4): j=0 (1): tổng 5, 4 > 1 ✓, tích 4 > 6 sai   → giữ nguyên
Kết quả: [2, 1]
```

**Input:** `nums = [-3, -1, 4, 2]`, `target = 1`
**Output:** `[3, 1]`

```
i=2 (4): j=0 (-3): tổng 1, 4 > -3 ✓, tích -12 > -∞  → best = -12, res = [2, 0]
i=3 (2): j=1 (-1): tổng 1, 2 > -1 ✓, tích -2 > -12  → best = -2,  res = [3, 1]
```

**Input:** `nums = [3, 3, 5]`, `target = 6` → **Output:** `[-1, -1]` (cặp `3 + 3` có tổng đúng nhưng `3 > 3` sai).

## Ghi nhớ
Bài Q1 của contest gần như luôn vét cạn được — nhìn ràng buộc rồi viết thẳng. Cẩn thận hai chỗ: giá trị khởi tạo của "tốt nhất" khi đáp án có thể âm, và cặp có thứ tự hay không.
