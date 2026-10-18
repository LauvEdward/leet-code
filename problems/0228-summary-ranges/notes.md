---
id: 228
title: Summary Ranges
slug: summary-ranges
difficulty: Easy
topics: Intervals, Array
date: 2026-10-18
time: O(n)
space: O(1) phụ (không tính kết quả)
status: Chưa nộp (LeetCode trong Chrome chưa đăng nhập)
---
## Đề bài
Cho mảng số nguyên **đã sắp tăng, không trùng**. Tóm tắt thành danh sách khoảng liên tiếp ngắn nhất: khoảng `a..b` viết là `"a->b"`, khoảng chỉ một số viết là `"a"`.

## Cơ sở lý thuyết
- **Chia mảng thành các đoạn chạy (run)** tối đa thỏa một tính chất — ở đây là "mỗi phần tử lớn hơn phần tử trước đúng 1". Hai con trỏ: `i` đánh dấu đầu đoạn, `j` chạy tới cuối đoạn.
- Mỗi phần tử được duyệt đúng một lần → `O(n)`.

## Hướng xử lý
1. `i = 0`.
2. Từ `i`, tăng `j` chừng nào `nums[j + 1] == nums[j] + 1`.
3. Ghi khoảng `nums[i]…nums[j]` (một số nếu `i == j`).
4. Đặt `i = j + 1`, lặp lại.

## Ý tưởng triển khai
- Điều kiện `j + 1 < nums.count` đứng trước để không truy cập ngoài mảng.
- Ghép chuỗi bằng `String(nums[i]) + "->" + String(nums[j])`.
- Giá trị tới `±2³¹` nhưng `nums[j] + 1` dùng `Int` 64 bit nên không tràn.
- Mảng rỗng → trả mảng rỗng.

## Ví dụ chạy từng bước
**Input:** `nums = [0, 1, 2, 4, 5, 7]`
**Output:** `["0->2", "4->5", "7"]`

```
i=0: j=0 → 1 == 0+1 ✓ j=1 → 2 == 1+1 ✓ j=2 → 4 == 2+1 ✗ dừng  → "0->2", i=3
i=3: j=3 → 5 == 4+1 ✓ j=4 → 7 == 5+1 ✗ dừng                    → "4->5", i=5
i=5: j=5 → hết mảng                                              → "7",    i=6
```

**Input:** `nums = [0, 2, 3, 4, 6, 8, 9]` → **Output:** `["0", "2->4", "6", "8->9"]`

**Input:** `nums = []` → **Output:** `[]`

## Ghi nhớ
Gom các phần tử liên tiếp thỏa điều kiện → hai con trỏ `i` (đầu đoạn) và `j` (cuối đoạn). Mở đầu cho nhóm bài Intervals (56, 57, 452).
