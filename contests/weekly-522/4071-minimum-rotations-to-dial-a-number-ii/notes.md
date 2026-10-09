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

## Ghi nhớ
"Được làm một thao tác tối đa một lần" → hỏi: thao tác đó thay đổi **bao nhiêu số hạng** của hàm mục tiêu? Thường chỉ một vài số hạng ở biên, nên mỗi lựa chọn tính được trong `O(1)`. Đảo đoạn + chi phí đối xứng giữa các phần tử kề = chỉ biên thay đổi (cùng ý tưởng với 2-opt trong bài người du lịch).
