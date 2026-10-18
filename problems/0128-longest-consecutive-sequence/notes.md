---
id: 128
title: Longest Consecutive Sequence
slug: longest-consecutive-sequence
difficulty: Medium
topics: Hashmap, Array, Union Find
date: 2026-10-18
time: O(n)
space: O(n)
status: Chưa nộp (LeetCode trong Chrome chưa đăng nhập)
---
## Đề bài
Cho mảng chưa sắp `nums`, tìm độ dài dãy số nguyên liên tiếp dài nhất (ví dụ `1, 2, 3, 4`) có thể tạo từ các phần tử của mảng. Yêu cầu `O(n)`.

## Cơ sở lý thuyết
- Sắp xếp rồi đếm là `O(n log n)` — vi phạm yêu cầu.
- **Chỉ đếm từ đầu dãy**: một số `x` là **điểm bắt đầu** của một dãy liên tiếp khi và chỉ khi `x - 1` không có trong tập. Chỉ từ những điểm này mới đếm lên `x + 1, x + 2, …`.
- **Phân tích khấu hao**: mỗi phần tử chỉ được "đếm qua" đúng một lần — trong lượt đếm từ điểm bắt đầu của dãy chứa nó. Tổng số lần tra tập là `O(n)`, dù có vòng `while` lồng trong `for`.

## Hướng xử lý
1. Bỏ hết vào một `Set` (vừa khử trùng vừa tra `O(1)`).
2. Với mỗi `x` trong tập mà `x - 1` không có trong tập: đếm độ dài dãy bắt đầu từ `x`.
3. Lấy độ dài lớn nhất.

## Ý tưởng triển khai
- Duyệt trên **tập** thay vì mảng gốc: nếu mảng có nhiều phần tử trùng là điểm bắt đầu, duyệt mảng sẽ đếm lại cùng một dãy nhiều lần.
- `for x in set where !set.contains(x - 1)` — lọc điểm bắt đầu ngay ở vòng lặp.
- Mảng rỗng → vòng lặp không chạy → `0`.
- Test cục bộ: đối chiếu với cách sắp xếp, và chạy thử 100.000 phần tử.

## Ví dụ chạy từng bước
**Input:** `nums = [100, 4, 200, 1, 3, 2]`
**Output:** `4`

```
set = {100, 4, 200, 1, 3, 2}   (duyệt theo thứ tự bất kỳ của Set)
x=100: 99 không có → đầu dãy → 101 không có → dài 1      best = 1
x=4:   3 có → không phải đầu dãy → bỏ qua
x=200: 199 không có → đầu dãy → dài 1                     best = 1
x=1:   0 không có → đầu dãy → 2 ✓, 3 ✓, 4 ✓, 5 ✗ → dài 4  best = 4
x=3:   2 có → bỏ qua
x=2:   1 có → bỏ qua
Trả về 4
```

**Input:** `nums = [1, 0, 1, 2]` → **Output:** `3`

```
set = {0, 1, 2}: chỉ 0 là đầu dãy → 1 ✓, 2 ✓, 3 ✗ → dài 3
```

## Ghi nhớ
Cần `O(n)` mà cách tự nhiên là sắp xếp → nghĩ tới bảng băm + "chỉ bắt đầu từ phần tử đầu tiên của mỗi nhóm" để mỗi phần tử chỉ bị duyệt một lần.
