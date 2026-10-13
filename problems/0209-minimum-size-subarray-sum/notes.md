---
id: 209
title: Minimum Size Subarray Sum
slug: minimum-size-subarray-sum
difficulty: Medium
topics: Sliding Window, Array, Prefix Sum, Binary Search
date: 2026-10-13
time: O(n)
space: O(1)
status: Accepted
---
## Đề bài
Cho mảng số **nguyên dương** `nums` và `target`. Tìm độ dài nhỏ nhất của một mảng con liên tiếp có tổng `≥ target`; không có thì trả `0`.

## Cơ sở lý thuyết
- **Cửa sổ trượt độ dài thay đổi**: mở rộng biên phải để đạt điều kiện, rồi co biên trái để tối ưu.
- **Điều kiện áp dụng**: mọi phần tử **dương** → thêm phần tử thì tổng tăng, bớt thì tổng giảm (tính đơn điệu). Nếu có số âm, cửa sổ trượt sai và phải dùng tổng tiền tố + hàng đợi đơn điệu.
- Mỗi phần tử vào cửa sổ một lần và ra một lần → `O(n)` dù có vòng `while` lồng trong `for`.

## Hướng xử lý
1. Duyệt `r`, cộng `nums[r]` vào `sum`.
2. Chừng nào `sum >= target`: ghi nhận độ dài `r - l + 1`, rồi bỏ `nums[l]` và tăng `l` (thử cửa sổ ngắn hơn).
3. Không lần nào đạt → trả `0`.

## Ý tưởng triển khai
- `best = Int.max` làm lính canh; cuối cùng đổi về `0` nếu chưa được cập nhật.
- Ghi nhận **trước** khi co — cửa sổ hiện tại đang hợp lệ.
- Test cục bộ đối chiếu với vét cạn mọi mảng con.

## Ví dụ chạy từng bước
**Input:** `target = 7`, `nums = [2, 3, 1, 2, 4, 3]`
**Output:** `2` (mảng con `[4, 3]`)

```
r=0 (2): sum=2
r=1 (3): sum=5
r=2 (1): sum=6
r=3 (2): sum=8 >= 7 → best = 4 ([2,3,1,2]), bỏ 2 → sum=6, l=1
r=4 (4): sum=10 >= 7 → best = 4 ([3,1,2,4]), bỏ 3 → sum=7, l=2
         sum=7 >= 7  → best = 3 ([1,2,4]),   bỏ 1 → sum=6, l=3
r=5 (3): sum=9 >= 7  → best = 3 ([2,4,3]),   bỏ 2 → sum=7, l=4
         sum=7 >= 7  → best = 2 ([4,3]),     bỏ 4 → sum=3, l=5
Trả về 2
```

**Input:** `target = 11`, `nums = [1, 1, 1, 1, 1, 1, 1, 1]` → **Output:** `0`

```
Tổng cả mảng là 8 < 11 → vòng while không bao giờ chạy → best vẫn là Int.max → trả 0
```

## Ghi nhớ
Mảng con liên tiếp + phần tử không âm + điều kiện trên tổng → cửa sổ trượt. Luôn tự hỏi "có số âm không?" trước khi dùng.
