---
id: 26
title: Remove Duplicates from Sorted Array
slug: remove-duplicates-from-sorted-array
difficulty: Easy
topics: Array / String, Two Pointers
date: 2026-10-11
time: O(n)
space: O(1)
status: Accepted
---
## Đề bài
Cho mảng `nums` đã sắp không giảm. Xóa trùng tại chỗ để mỗi giá trị chỉ còn một lần, giữ nguyên thứ tự. Trả về số giá trị khác nhau `k`; `k` ô đầu chứa chúng.

## Cơ sở lý thuyết
- Trong mảng **đã sắp xếp**, các phần tử bằng nhau nằm **liền nhau**. Vậy "đã gặp giá trị này chưa" chỉ cần so với phần tử vừa giữ lại gần nhất — không cần `Set`.
- **Con trỏ đọc/ghi** như bài 27, với điều kiện giữ là "khác phần tử cuối của phần đã giữ".

## Hướng xử lý
1. Phần tử đầu tiên luôn được giữ → `k = 1`.
2. Duyệt `i` từ `1`: nếu `nums[i] != nums[k - 1]` thì đó là giá trị mới → ghi vào `nums[k]`, tăng `k`.
3. Trả về `k`.

## Ý tưởng triển khai
- So với `nums[k - 1]` (phần tử cuối đã giữ) chứ không phải `nums[i - 1]`; hai cách đều đúng ở bài này, nhưng cách đầu mở rộng được sang bài 80.
- Đề đảm bảo mảng có ít nhất 1 phần tử nên `k = 1` là an toàn.

## Ví dụ chạy từng bước
**Input:** `nums = [0, 0, 1, 1, 1, 2, 2, 3, 3, 4]`
**Output:** `5`, `nums = [0, 1, 2, 3, 4, _, _, _, _, _]`

```
k=1 (đã giữ [0])
i=1 (0): bằng nums[0]=0 → bỏ
i=2 (1): khác nums[0]=0 → nums[1] = 1   k=2
i=3 (1): bằng nums[1]=1 → bỏ
i=4 (1): bằng nums[1]=1 → bỏ
i=5 (2): khác nums[1]=1 → nums[2] = 2   k=3
i=6 (2): bằng nums[2]=2 → bỏ
i=7 (3): khác nums[2]=2 → nums[3] = 3   k=4
i=8 (3): bằng nums[3]=3 → bỏ
i=9 (4): khác nums[3]=3 → nums[4] = 4   k=5
```

**Input:** `nums = [1, 1, 2]` → **Output:** `2`, `nums = [1, 2, _]`

## Ghi nhớ
"Đã sắp xếp" là gợi ý lớn: trùng lặp nằm liền nhau, nên chỉ cần nhìn lại một bước.
