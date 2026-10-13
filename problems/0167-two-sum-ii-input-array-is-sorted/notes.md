---
id: 167
title: Two Sum II - Input Array Is Sorted
slug: two-sum-ii-input-array-is-sorted
difficulty: Medium
topics: Two Pointers, Array, Binary Search
date: 2026-10-13
time: O(n)
space: O(1)
status: Accepted
---
## Đề bài
Cho mảng `numbers` **đã sắp tăng** và `target`. Tìm hai phần tử có tổng bằng `target`, trả về chỉ số **tính từ 1**. Đề đảm bảo có đúng một đáp án và yêu cầu bộ nhớ phụ hằng số.

## Cơ sở lý thuyết
- **Hai con trỏ ngược chiều trên mảng đã sắp**: `l` ở đầu (nhỏ nhất), `r` ở cuối (lớn nhất). Tổng quá nhỏ thì chỉ có cách tăng `l`; tổng quá lớn thì chỉ có cách giảm `r`.
- **Vì sao không bỏ sót**: khi tổng `< target`, `numbers[l]` cộng với phần tử lớn nhất còn lại vẫn thiếu → `numbers[l]` không thể thuộc đáp án → loại hẳn. Tương tự cho `r`. Mỗi bước loại chắc chắn một phần tử.
- So với bài 1 (Two Sum): mảng đã sắp nên không cần bảng băm, bộ nhớ `O(1)`.

## Hướng xử lý
1. `l = 0`, `r = n - 1`.
2. Tính tổng: bằng `target` → trả `[l + 1, r + 1]`; nhỏ hơn → `l += 1`; lớn hơn → `r -= 1`.

## Ý tưởng triển khai
- Nhớ cộng 1 vào chỉ số khi trả về.
- `return []` ở cuối chỉ để biên dịch được — đề đảm bảo luôn có đáp án.

## Ví dụ chạy từng bước
**Input:** `numbers = [2, 7, 11, 15]`, `target = 9`
**Output:** `[1, 2]`

```
l=0 (2), r=3 (15): tổng 17 > 9 → r=2
l=0 (2), r=2 (11): tổng 13 > 9 → r=1
l=0 (2), r=1 (7):  tổng 9 == 9 → trả về [0+1, 1+1] = [1, 2]
```

**Input:** `numbers = [2, 3, 4]`, `target = 6`
**Output:** `[1, 3]`

```
l=0 (2), r=2 (4): tổng 6 == 6 → [1, 3]
```

**Input:** `numbers = [-1, 0]`, `target = -1` → **Output:** `[1, 2]`

## Ghi nhớ
Mảng đã sắp + tìm cặp theo tổng → hai con trỏ từ hai đầu. Đây là khối lõi của 3Sum (bài 15) và các bài `k`-sum.
