---
id: 5
title: Longest Palindromic Substring
slug: longest-palindromic-substring
difficulty: Medium
topics: Two Pointers, String, Dynamic Programming
date: 2026-10-09
time: O(n²)
space: O(n) (mảng ký tự của chuỗi)
status: Accepted
---
## Đề bài
Cho chuỗi `s`, trả về chuỗi con đối xứng (palindrome) dài nhất.

## Cơ sở lý thuyết
- **Palindrome** đọc xuôi ngược như nhau, tức đối xứng qua một **tâm**. Tâm có thể là một ký tự (độ dài lẻ, `aba`) hoặc khe giữa hai ký tự (độ dài chẵn, `abba`). Chuỗi dài `n` có `2n - 1` tâm.
- **Tính chất lồng nhau**: nếu `s[l...r]` là palindrome thì `s[l+1...r-1]` cũng vậy. Ngược lại, palindrome mở rộng được khi và chỉ khi hai ký tự ở hai đầu bằng nhau.
- Có ba cách phổ biến: quy hoạch động `O(n²)` thời gian + `O(n²)` bộ nhớ; **mở rộng từ tâm** `O(n²)` thời gian + `O(1)` bộ nhớ phụ; thuật toán **Manacher** `O(n)`.

## Hướng xử lý
1. Vét cạn: thử mọi cặp `(l, r)` và kiểm tra đối xứng → `O(n³)`.
2. Dùng tính chất lồng nhau: thay vì kiểm tra từ ngoài vào, ta đi **từ tâm ra**. Mỗi tâm mở rộng tối đa `O(n)` bước và dừng ngay khi gặp cặp ký tự khác nhau.
3. Duyệt cả `2n - 1` tâm, giữ lại palindrome dài nhất.

Với `n ≤ 1000`, `O(n²)` là quá đủ; Manacher chỉ cần khi `n` lên tới hàng trăm nghìn.

## Ý tưởng triển khai
- Hàm lồng `expand(i, j)`: lùi `l`, tiến `r` khi còn khớp. Khi dừng, `l` và `r` đã vượt quá biên một bước nên palindrome là `a[l+1...r-1]`, độ dài `r - l - 1`.
- Hàm lồng cập nhật thẳng `start`, `len` của hàm ngoài — khỏi phải trả về rồi tính ngược vị trí bắt đầu từ tâm.
- Gọi `expand(i, i)` cho tâm lẻ và `expand(i, i + 1)` cho tâm chẵn.
- Cắt chuỗi **một lần** ở cuối, tránh tạo `String` trong vòng lặp.
- Làm việc trên `Array(s)` để có chỉ số nguyên `O(1)`.

## Ghi nhớ
Bài palindrome → nghĩ "tâm đối xứng" trước. Nhớ xử lý **cả hai loại tâm**; quên tâm chẵn là lỗi thường gặp nhất (sai với `"cbbd"`).
