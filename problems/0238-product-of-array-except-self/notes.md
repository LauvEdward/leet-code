---
id: 238
title: Product of Array Except Self
slug: product-of-array-except-self
difficulty: Medium
topics: Array / String, Prefix Sum
date: 2026-10-11
time: O(n)
space: O(1) phụ (không tính mảng kết quả)
status: Accepted
---
## Đề bài
Trả về mảng `answer` với `answer[i]` là tích mọi phần tử của `nums` trừ `nums[i]`. Yêu cầu `O(n)` và **không dùng phép chia**.

## Cơ sở lý thuyết
- **Tích tiền tố và hậu tố**: tích của mọi phần tử trừ `nums[i]` = (tích các phần tử bên trái `i`) × (tích các phần tử bên phải `i`).
- Đây là biến thể của **tổng tiền tố** với phép nhân. Khi phép toán không có nghịch đảo dùng được (ở đây phép chia bị cấm, và số `0` làm phép chia vô nghĩa), ghép tiền tố với hậu tố là cách thay thế chuẩn.
- **Tái sử dụng mảng kết quả** để lưu tiền tố, còn hậu tố chỉ cần một biến chạy → bộ nhớ phụ `O(1)`.

## Hướng xử lý
1. Lượt 1 (trái → phải): `res[i]` = tích của `nums[0…i-1]`.
2. Lượt 2 (phải → trái): giữ `right` = tích của `nums[i+1…]`; nhân `res[i]` với `right`, rồi nhân `right` với `nums[i]`.

## Ý tưởng triển khai
- `res` khởi tạo toàn `1`; `res[0] = 1` vì bên trái ô đầu không có gì (tích rỗng bằng 1).
- Trong lượt 2 phải nhân `res[i]` **trước** rồi mới cập nhật `right`, để `right` không chứa `nums[i]`.
- Số `0` được xử lý tự nhiên, không cần nhánh riêng.

## Ví dụ chạy từng bước
**Input:** `nums = [1, 2, 3, 4]`
**Output:** `[24, 12, 8, 6]`

```
Lượt 1 — tích bên trái:
   res[0] = 1
   res[1] = res[0] · nums[0] = 1 · 1 = 1
   res[2] = res[1] · nums[1] = 1 · 2 = 2
   res[3] = res[2] · nums[2] = 2 · 3 = 6
   res = [1, 1, 2, 6]

Lượt 2 — nhân tích bên phải (right = 1):
   i=3: res[3] = 6 · 1  = 6    right = 1 · 4  = 4
   i=2: res[2] = 2 · 4  = 8    right = 4 · 3  = 12
   i=1: res[1] = 1 · 12 = 12   right = 12 · 2 = 24
   i=0: res[0] = 1 · 24 = 24   right = 24
   res = [24, 12, 8, 6]
```

**Input:** `nums = [-1, 1, 0, -3, 3]` → **Output:** `[0, 0, 9, 0, 0]`

```
Lượt 1: res = [1, -1, -1, 0, 0]
Lượt 2: i=4: 0·1 = 0, right=3 · i=3: 0·3 = 0, right=-9 · i=2: -1·(-9) = 9, right=0
        i=1: -1·0 = 0 · i=0: 1·0 = 0
```

## Ghi nhớ
"Kết quả tại `i` phụ thuộc mọi phần tử trừ `i`" → trái × phải. Cùng ý tưởng cho bài hứng nước mưa (max trái / max phải) và bài kẹo (135).
