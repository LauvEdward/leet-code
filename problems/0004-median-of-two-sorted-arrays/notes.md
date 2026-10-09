---
id: 4
title: Median of Two Sorted Arrays
slug: median-of-two-sorted-arrays
difficulty: Hard
topics: Array, Binary Search, Divide and Conquer
date: 2026-10-09
time: O(log(min(m, n)))
space: O(1)
status: Accepted
---
## Đề bài
Cho hai mảng đã sắp xếp `nums1` (độ dài `m`) và `nums2` (độ dài `n`). Tìm trung vị của hai mảng gộp lại, với độ phức tạp `O(log(m + n))`.

## Cơ sở lý thuyết
- **Trung vị** chia tập dữ liệu thành hai nửa bằng nhau sao cho mọi phần tử nửa trái `≤` mọi phần tử nửa phải. Trung vị là `max(nửa trái)` (tổng lẻ) hoặc trung bình của `max(nửa trái)` và `min(nửa phải)` (tổng chẵn).
- **Tìm kiếm nhị phân trên đáp án**: không tìm một giá trị trong mảng mà tìm một **vị trí cắt** thỏa điều kiện đơn điệu.
- **Phân hoạch (partition)**: cắt `a` tại `i` và `b` tại `j`. Nếu cố định kích thước nửa trái là `half = (m + n + 1) / 2` thì `j = half - i` — chỉ còn **một** ẩn số `i`.

## Hướng xử lý
1. Gộp hai mảng rồi lấy phần tử giữa là `O(m + n)` — đúng nhưng không đạt yêu cầu log.
2. Yêu cầu `log` gợi ý tìm nhị phân. Ta tìm `i` sao cho phép cắt hợp lệ:
   - `a[i-1] ≤ b[j]` (trái của `a` không vượt phải của `b`)
   - `b[j-1] ≤ a[i]` (trái của `b` không vượt phải của `a`)
3. Tính đơn điệu: nếu `a[i-1] > b[j]` thì ta lấy **quá nhiều** từ `a` → giảm `i`. Ngược lại, nếu `b[j-1] > a[i]` thì lấy quá ít → tăng `i`.
4. Tìm nhị phân trên mảng **ngắn hơn** để đạt `O(log(min(m, n)))` và đảm bảo `j` không bao giờ âm.

## Ý tưởng triển khai
- Hoán đổi để `a` là mảng ngắn hơn; `lo = 0`, `hi = m` (có `m + 1` vị trí cắt, kể cả lấy 0 hoặc lấy hết).
- **Lính canh**: khi cắt ở mép, coi phần tử "ngoài biên" là `Int.min` (bên trái) hoặc `Int.max` (bên phải). Nhờ đó không phải viết nhánh riêng cho mảng rỗng hay cắt ở đầu/cuối.
- `half = (m + n + 1) / 2` — cộng 1 để khi tổng lẻ, nửa trái nhiều hơn 1 phần tử, và trung vị chính là `max(aL, bL)`.
- Khi tổng chẵn: `(max(aL, bL) + min(aR, bR)) / 2`.
- Cách "lười" vẫn qua được LeetCode: `(nums1 + nums2).sorted()` rồi lấy phần tử giữa — `O((m+n) log(m+n))`, đáng biết để viết nhanh khi phỏng vấn trước khi tối ưu.

## Ví dụ chạy từng bước
**Input:** `nums1 = [1, 3]`, `nums2 = [2]`
**Output:** `2.0`

Sau khi hoán đổi: `a = [2]` (ngắn hơn), `b = [1, 3]`, `m = 1`, `n = 2`, `half = 2`.

```
lo=0, hi=1 → i=0, j=2
   aL=-∞  aR=2  |  bL=3  bR=+∞
   bL=3 > aR=2 → lấy quá ít từ a → lo = 1

lo=1, hi=1 → i=1, j=1
   aL=2  aR=+∞  |  bL=1  bR=3
   aL <= bR và bL <= aR → phép cắt hợp lệ
   tổng 3 phần tử (lẻ) → trung vị = max(aL, bL) = max(2, 1) = 2
```

**Input:** `nums1 = [1, 2]`, `nums2 = [3, 4]`
**Output:** `2.5`

`a = [1, 2]`, `b = [3, 4]`, `m = n = 2`, `half = 2`.

```
lo=0, hi=2 → i=1, j=1
   aL=1  aR=2  |  bL=3  bR=4
   bL=3 > aR=2 → lo = 2

lo=2, hi=2 → i=2, j=0
   aL=2  aR=+∞  |  bL=-∞  bR=3
   hợp lệ; tổng 4 phần tử (chẵn)
   → (max(2, -∞) + min(+∞, 3)) / 2 = (2 + 3) / 2 = 2.5
```

## Ghi nhớ
Mấu chốt là đổi câu hỏi từ "tìm phần tử thứ k" thành "tìm vị trí cắt hợp lệ". Luôn nhị phân trên mảng ngắn hơn và dùng lính canh `±∞` cho biên — hai mẹo này loại bỏ gần hết lỗi lệch-một.
