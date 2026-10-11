---
id: 80
title: Remove Duplicates from Sorted Array II
slug: remove-duplicates-from-sorted-array-ii
difficulty: Medium
topics: Array / String, Two Pointers
date: 2026-10-11
time: O(n)
space: O(1)
status: Accepted
---
## Đề bài
Như bài 26 nhưng mỗi giá trị được giữ **tối đa hai lần**. Làm tại chỗ, trả về độ dài mới `k`.

## Cơ sở lý thuyết
- Tổng quát hóa bài 26: muốn giữ tối đa `c` bản sao thì so phần tử đang xét với phần tử cách vị trí ghi `c` ô về trước (`nums[k - c]`).
- Lý do: phần đã giữ `nums[0..<k]` cũng đang sắp tăng. Nếu `x == nums[k - 2]` thì cả `nums[k - 2]` và `nums[k - 1]` đều bằng `x` — đã đủ hai bản.

## Hướng xử lý
1. Con trỏ ghi `k = 0`, duyệt từng `x`.
2. Giữ `x` nếu `k < 2` (chưa đủ hai phần tử để so) hoặc `x != nums[k - 2]`.
3. Trả về `k`.

## Ý tưởng triển khai
- Phải so với `nums[k - 2]` của **phần đã ghi**, không phải `nums[i - 2]` của mảng gốc — mảng gốc đã bị ghi đè một phần nên so theo `i` sẽ sai.
- Đổi số `2` thành `c` là có lời giải cho "tối đa `c` lần".

## Ví dụ chạy từng bước
**Input:** `nums = [1, 1, 1, 2, 2, 3]`
**Output:** `5`, `nums = [1, 1, 2, 2, 3, _]`

```
x=1: k=0 < 2                  → nums[0] = 1   k=1
x=1: k=1 < 2                  → nums[1] = 1   k=2
x=1: nums[k-2] = nums[0] = 1  → bằng → bỏ (đã đủ 2 số 1)
x=2: nums[0] = 1 ≠ 2          → nums[2] = 2   k=3
x=2: nums[1] = 1 ≠ 2          → nums[3] = 2   k=4
x=3: nums[2] = 2 ≠ 3          → nums[4] = 3   k=5
```

**Input:** `nums = [0, 0, 1, 1, 1, 1, 2, 3, 3]` → **Output:** `7`, `nums = [0, 0, 1, 1, 2, 3, 3, _, _]`

## Ghi nhớ
"Giữ tối đa `c` bản" → `if k < c || x != nums[k - c]`. Một dòng điều kiện bao luôn cả bài 26 (`c = 1`).
