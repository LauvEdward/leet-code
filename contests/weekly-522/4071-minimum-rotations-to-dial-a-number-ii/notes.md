---
id: 4071
title: Minimum Rotations to Dial a Number II
slug: minimum-rotations-to-dial-a-number-ii
difficulty: Medium
topics: Weekly Contest 522, String, Math, Enumeration
date: 2026-10-09
time: O(n)
space: O(n)
status: Accepted
---
## Đề bài
Giống bài I (mặt số tròn `0…9`, kim bắt đầu ở `0`), nhưng chuỗi `s` dài `n ≤ 10⁵` và trước khi quay được phép **đảo ngược một hậu tố** `s[k..n-1]` tối đa một lần. Tính tổng số lần quay ít nhất.

## Cơ sở lý thuyết
- **Khoảng cách vòng tròn đối xứng**: `d(a, b) = d(b, a)`.
- **Đảo một đoạn không đổi tổng chi phí bên trong đoạn**: chi phí của một đoạn là tổng `d` giữa các cặp kề nhau. Đảo đoạn chỉ đảo thứ tự các cặp đó, và vì `d` đối xứng nên tổng giữ nguyên.
- **Phân tích đóng góp (delta)**: thay vì tính lại toàn bộ cho mỗi lựa chọn, tìm xem lựa chọn đó làm thay đổi **những số hạng nào** của tổng và chỉ tính phần chênh lệch.

## Hướng xử lý
1. Thử mọi `k` và mô phỏng lại là `O(n²)` — quá chậm với `n = 10⁵`.
2. Tách tổng chi phí thành ba phần khi đảo hậu tố từ `k`:
   - Phần đầu `s[0..k-1]`: không đổi.
   - Bên trong hậu tố: không đổi (lý do ở trên).
   - **Bước nối** từ phần tử đứng trước hậu tố vào hậu tố: trước là `d(p, s[k])`, sau khi đảo thành `d(p, s[n-1])`, với `p = s[k-1]` (hoặc `0` — vị trí ban đầu của kim — khi `k = 0`).
3. Vậy `cost(k) = total - d(p, s[k]) + d(p, s[n-1])`. Tính `total` một lần rồi duyệt mọi `k` trong `O(n)`.
4. Trường hợp "không đảo" tự được tính: `k = n - 1` cho đúng `total`.

## Ý tưởng triển khai
- `a = s.map { $0.wholeNumberValue! }` để có mảng số.
- Hàm lồng `d(x, y)` cho khoảng cách vòng.
- Một vòng tính `total`, một vòng lấy `min` theo công thức delta.
- Test cục bộ đối chiếu với cách vét cạn (đảo thật rồi mô phỏng) trên chuỗi ngẫu nhiên ngắn.

## Ví dụ chạy từng bước
**Input:** `n = 4`, `s = "1502"`
**Output:** `9`

Bước 1 — chi phí khi không đảo:

```
0 → 1 : 1
1 → 5 : 4
5 → 0 : 5
0 → 2 : 2
total = 12
```

Bước 2 — thử từng `k`, chỉ tính phần chênh lệch ở bước nối. Chữ số cuối là `s[3] = 2`:

```
k=0: p=0 (kim ban đầu)  12 - d(0,1) + d(0,2) = 12 - 1 + 2 = 13    chuỗi thành "2051"
k=1: p=1                12 - d(1,5) + d(1,2) = 12 - 4 + 1 = 9     chuỗi thành "1205"  ← nhỏ nhất
k=2: p=5                12 - d(5,0) + d(5,2) = 12 - 5 + 3 = 10    chuỗi thành "1520"
k=3: p=0                12 - d(0,2) + d(0,2) = 12                 không đổi gì
best = 9
```

Kiểm tra lại `k = 1` bằng mô phỏng `"1205"`: `0→1` (1) + `1→2` (1) + `2→0` (2) + `0→5` (5) = 9.

## Ghi nhớ
"Được làm một thao tác tối đa một lần" → hỏi: thao tác đó thay đổi **bao nhiêu số hạng** của hàm mục tiêu? Thường chỉ một vài số hạng ở biên, nên mỗi lựa chọn tính được trong `O(1)`. Đảo đoạn + chi phí đối xứng giữa các phần tử kề = chỉ biên thay đổi (cùng ý tưởng với 2-opt trong bài người du lịch).
