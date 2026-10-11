---
id: 169
title: Majority Element
slug: majority-element
difficulty: Easy
topics: Array / String, Hash Table, Boyer-Moore Voting
date: 2026-10-11
time: O(n)
space: O(1)
status: Accepted
---
## Đề bài
Cho mảng `nums` độ dài `n`, tìm phần tử xuất hiện **nhiều hơn** `n / 2` lần (đề đảm bảo luôn tồn tại).

## Cơ sở lý thuyết
- **Thuật toán bỏ phiếu Boyer–Moore**: giữ một ứng viên và một bộ đếm. Gặp phần tử bằng ứng viên thì `+1`, khác thì `-1`; khi bộ đếm về `0` thì đổi ứng viên.
- **Vì sao đúng**: mỗi lần `-1` tương đương ghép một phần tử của ứng viên với một phần tử khác rồi loại cả hai. Phần tử chiếm đa số có nhiều hơn tổng tất cả phần tử còn lại, nên không thể bị triệt tiêu hết — nó là ứng viên sống sót cuối cùng.
- Các cách khác: đếm bằng `Dictionary` (`O(n)` bộ nhớ), hoặc sắp xếp rồi lấy phần tử giữa (`O(n log n)`).

## Hướng xử lý
1. `cand` chưa xác định, `cnt = 0`.
2. Với mỗi `x`: nếu `cnt == 0` thì nhận `x` làm ứng viên; sau đó `cnt += 1` nếu `x == cand`, ngược lại `cnt -= 1`.
3. Trả về `cand`.

## Ý tưởng triển khai
- Đặt ứng viên **trước** khi cập nhật bộ đếm, nên phần tử vừa được chọn luôn được `+1`.
- Nếu đề **không** đảm bảo có phần tử đa số thì phải duyệt thêm lượt hai để đếm lại ứng viên.

## Ví dụ chạy từng bước
**Input:** `nums = [2, 2, 1, 1, 1, 2, 2]`
**Output:** `2`

```
x=2: cnt=0 → cand=2      → cnt=1
x=2: bằng cand           → cnt=2
x=1: khác cand           → cnt=1
x=1: khác cand           → cnt=0
x=1: cnt=0 → cand=1      → cnt=1
x=2: khác cand           → cnt=0
x=2: cnt=0 → cand=2      → cnt=1
Trả về cand = 2
```

Ứng viên có lúc đổi sang `1`, nhưng số `2` (4 lần trên 7) không thể bị triệt tiêu hết.

**Input:** `nums = [3, 2, 3]` → **Output:** `3`

```
x=3: cand=3, cnt=1 · x=2: cnt=0 · x=3: cand=3, cnt=1
```

## Ghi nhớ
"Phần tử chiếm hơn nửa" + yêu cầu `O(1)` bộ nhớ → Boyer–Moore. Ý tưởng "triệt tiêu từng cặp khác nhau" còn mở rộng được cho bài tìm phần tử xuất hiện hơn `n / 3` lần (giữ hai ứng viên).
