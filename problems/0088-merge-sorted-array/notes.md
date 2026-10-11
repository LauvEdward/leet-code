---
id: 88
title: Merge Sorted Array
slug: merge-sorted-array
difficulty: Easy
topics: Array / String, Two Pointers, Sorting
date: 2026-10-11
time: O(m + n)
space: O(1)
status: Accepted
---
## Đề bài
Cho hai mảng đã sắp tăng `nums1` (có `m` phần tử thật, phía sau là `n` ô trống) và `nums2` (`n` phần tử). Gộp `nums2` vào `nums1` sao cho `nums1` vẫn sắp tăng, làm tại chỗ.

## Cơ sở lý thuyết
- **Trộn hai dãy đã sắp (merge)**: bước lõi của merge sort — mỗi lần so hai phần tử đầu dãy và lấy cái phù hợp, `O(m + n)`.
- **Hai con trỏ đi từ cuối**: khi mảng đích có chỗ trống ở **cuối**, điền từ cuối về đầu thì không bao giờ ghi đè lên phần tử chưa xét.
- Bất biến: vị trí ghi `k = i + j + 1` luôn `≥ i`, nên ô đang ghi hoặc là ô trống, hoặc là ô của phần tử `nums1` đã được chuyển đi.

## Hướng xử lý
1. Trộn từ đầu sẽ phải dời phần tử của `nums1` → cần mảng phụ. Trộn từ cuối thì không.
2. Ba con trỏ: `i` ở cuối phần thật của `nums1`, `j` ở cuối `nums2`, `k` ở cuối `nums1`.
3. Mỗi bước đặt số **lớn hơn** trong hai số đang trỏ vào `nums1[k]`.
4. Dừng khi `nums2` hết (`j < 0`). Nếu `nums1` hết trước thì chép nốt `nums2`; nếu `nums2` hết trước thì phần còn lại của `nums1` đã nằm đúng chỗ.

## Ý tưởng triển khai
- Điều kiện lặp chỉ cần `j >= 0`.
- `i >= 0 && nums1[i] > nums2[j]` — kiểm tra `i >= 0` trước để không truy cập chỉ số âm.
- Khi bằng nhau thì lấy từ `nums2`, không ảnh hưởng kết quả.

## Ví dụ chạy từng bước
**Input:** `nums1 = [1, 2, 3, 0, 0, 0]`, `m = 3`, `nums2 = [2, 5, 6]`, `n = 3`
**Output:** `[1, 2, 2, 3, 5, 6]`

```
i=2 (3), j=2 (6), k=5: 3 > 6 sai → ghi 6 → [1, 2, 3, 0, 0, 6]   j=1
i=2 (3), j=1 (5), k=4: 3 > 5 sai → ghi 5 → [1, 2, 3, 0, 5, 6]   j=0
i=2 (3), j=0 (2), k=3: 3 > 2 ✓  → ghi 3 → [1, 2, 3, 3, 5, 6]   i=1
i=1 (2), j=0 (2), k=2: 2 > 2 sai → ghi 2 → [1, 2, 2, 3, 5, 6]   j=-1 → dừng
```

**Input:** `nums1 = [0]`, `m = 0`, `nums2 = [1]`, `n = 1` → **Output:** `[1]`

```
i=-1, j=0, k=0: i < 0 → ghi 1 → [1]   j=-1 → dừng
```

## Ghi nhớ
Cần gộp/dời tại chỗ mà chỗ trống nằm ở cuối → đi từ cuối. Mẹo này lặp lại ở nhiều bài (thay khoảng trắng trong chuỗi, dời phần tử…).
