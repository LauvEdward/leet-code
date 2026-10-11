---
id: 189
title: Rotate Array
slug: rotate-array
difficulty: Medium
topics: Array / String, Math, Two Pointers
date: 2026-10-11
time: O(n)
space: O(1)
status: Accepted
---
## Đề bài
Xoay mảng `nums` sang phải `k` bước (phần tử cuối vòng lên đầu), làm tại chỗ.

## Cơ sở lý thuyết
- Xoay phải `k` bước nghĩa là `k` phần tử **cuối** chuyển lên **đầu**, phần còn lại lùi ra sau: `[A | B] → [B | A]`.
- **Mẹo ba lần đảo**: đảo toàn bộ `[A | B]` được `[Bᵣ | Aᵣ]` (hai khối đổi chỗ nhưng mỗi khối bị ngược); đảo riêng từng khối là được `[B | A]`.
- Xoay `n` bước thì mảng trở lại như cũ → chỉ cần xoay `k % n` bước.

## Hướng xử lý
1. `k = k % n`.
2. Đảo cả mảng.
3. Đảo `k` phần tử đầu.
4. Đảo `n - k` phần tử còn lại.

Các cách khác: dùng mảng phụ (`O(n)` bộ nhớ) hoặc dịch theo chu trình (khó viết đúng hơn).

## Ý tưởng triển khai
- `nums.reverse()` đảo tại chỗ; `nums[0..<k].reverse()` đảo tại chỗ một đoạn — Swift cho phép gọi hàm `mutating` qua subscript khoảng.
- Quên `% n` sẽ crash khi `k > n` (khoảng `0..<k` vượt mảng).
- Khi `k % n == 0`: lần đảo đầu và lần đảo cuối triệt tiêu nhau, mảng giữ nguyên.

## Ví dụ chạy từng bước
**Input:** `nums = [1, 2, 3, 4, 5, 6, 7]`, `k = 3`
**Output:** `[5, 6, 7, 1, 2, 3, 4]`

```
n = 7, k = 3 % 7 = 3
Đảo cả mảng:        [7, 6, 5, 4, 3, 2, 1]
Đảo 3 phần tử đầu:  [5, 6, 7, 4, 3, 2, 1]
Đảo 4 phần tử cuối: [5, 6, 7, 1, 2, 3, 4]
```

**Input:** `nums = [1, 2]`, `k = 3` → **Output:** `[2, 1]`

```
k = 3 % 2 = 1
Đảo cả mảng: [2, 1] · đảo 1 phần tử đầu: [2, 1] · đảo 1 phần tử cuối: [2, 1]
```

## Ghi nhớ
Hoán đổi hai khối liền nhau tại chỗ → đảo toàn bộ rồi đảo từng khối. Dùng lại được cho "xoay chuỗi", "đảo thứ tự các từ trong câu".
