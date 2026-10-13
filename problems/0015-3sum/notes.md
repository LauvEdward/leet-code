---
id: 15
title: 3Sum
slug: 3sum
difficulty: Medium
topics: Two Pointers, Array, Sorting
date: 2026-10-13
time: O(n²)
space: O(n) (mảng đã sắp, không tính kết quả)
status: Accepted
---
## Đề bài
Tìm mọi bộ ba **giá trị** khác nhau `[a, b, c]` lấy từ ba vị trí khác nhau của `nums` sao cho `a + b + c = 0`. Kết quả không được chứa bộ ba trùng lặp.

## Cơ sở lý thuyết
- **Quy về bài con đã biết**: cố định một phần tử `a[i]`, phần còn lại là bài "tìm cặp có tổng `-a[i]` trên mảng đã sắp" — chính là hai con trỏ của bài 167. Tổng chi phí `O(n) × O(n) = O(n²)`.
- **Sắp xếp để khử trùng lặp**: sau khi sắp, các giá trị bằng nhau nằm liền nhau, nên chỉ cần **bỏ qua giá trị vừa dùng** ở mỗi vị trí là không sinh ra bộ ba lặp — không cần `Set`.
- Cận dưới thực tế của bài là `O(n²)`; chưa có thuật toán nhanh hơn đáng kể.

## Hướng xử lý
1. Sắp tăng dần.
2. Với mỗi `i`: nếu `a[i]` bằng `a[i - 1]` thì bỏ qua (đã xét giá trị này làm phần tử đầu).
3. Hai con trỏ `l = i + 1`, `r = n - 1`: tổng âm → `l += 1`; dương → `r -= 1`; bằng 0 → ghi bộ ba, tiến cả hai con trỏ, rồi cho `l` nhảy qua các giá trị trùng.

## Ý tưởng triển khai
- Chỉ cần khử trùng cho `l`: khi `l` đã sang giá trị mới thì `r` cũ cho tổng khác 0 và tự bị đẩy đi.
- `while l < r && a[l] == a[l - 1]` — so với phần tử **vừa dùng** (`l - 1`).
- Có thể dừng sớm khi `a[i] > 0` (ba số dương không thể có tổng 0); bỏ qua cho gọn.
- Test cục bộ đối chiếu với vét cạn ba vòng lặp + `Set`, và kiểm tra không có bộ ba trùng.

## Ví dụ chạy từng bước
**Input:** `nums = [-1, 0, 1, 2, -1, -4]`
**Output:** `[[-1, -1, 2], [-1, 0, 1]]`

```
Sắp xếp: a = [-4, -1, -1, 0, 1, 2]

i=0 (-4): l=1, r=5: -4 + -1 + 2 = -3 < 0 → l=2
                    -4 + -1 + 2 = -3 < 0 → l=3
                    -4 +  0 + 2 = -2 < 0 → l=4
                    -4 +  1 + 2 = -1 < 0 → l=5 → dừng

i=1 (-1): l=2, r=5: -1 + -1 + 2 = 0 → ghi [-1, -1, 2], l=3, r=4
                    (a[3]=0 khác a[2]=-1 → không nhảy)
                    -1 + 0 + 1 = 0  → ghi [-1, 0, 1],  l=4, r=3 → dừng

i=2 (-1): bằng a[1] → bỏ qua (nếu không sẽ ghi lại [-1, 0, 1])

i=3 (0):  l=4, r=5: 0 + 1 + 2 = 3 > 0 → r=4 → dừng
```

**Input:** `nums = [0, 0, 0, 0]`
**Output:** `[[0, 0, 0]]`

```
i=0: l=1, r=3: tổng 0 → ghi [0, 0, 0], l=2, r=2 → dừng
i=1: bằng a[0] → bỏ qua
```

## Ghi nhớ
`k`-sum: sắp xếp, cố định `k - 2` phần tử bằng vòng lặp, hai phần tử cuối dùng hai con trỏ. Khử trùng lặp bằng cách bỏ qua giá trị kề giống nhau ở **mỗi tầng**.
