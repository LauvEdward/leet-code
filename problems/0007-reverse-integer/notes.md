---
id: 7
title: Reverse Integer
slug: reverse-integer
difficulty: Medium
topics: Math
date: 2026-10-09
time: O(log |x|) (số chữ số, tối đa 10)
space: O(1)
status: Accepted
---
## Đề bài
Cho số nguyên 32 bit có dấu `x`, trả về `x` với các chữ số đảo ngược. Nếu kết quả vượt khỏi khoảng `[-2³¹, 2³¹ - 1]` thì trả về `0`.

## Cơ sở lý thuyết
- **Tách chữ số bằng chia lấy dư**: `x % 10` lấy chữ số cuối, `x / 10` bỏ chữ số cuối. Ghép ngược lại bằng `res = res * 10 + chữ số`.
- **Phép chia số âm trong Swift** (giống C, Java) làm tròn **về 0**: `-123 % 10 == -3`, `-123 / 10 == -12`. Nhờ vậy cùng một vòng lặp chạy đúng cho cả số âm, không cần tách dấu.
- **Tràn số (overflow)**: khoảng 32 bit là `[-2147483648, 2147483647]`. Đảo `1534236469` ra `9646324351` — vượt giới hạn.

## Hướng xử lý
1. Lặp: lấy chữ số cuối của `x`, đẩy vào cuối `res`, cho tới khi `x == 0`.
2. Xử lý tràn — có hai cách:
   - **Cách đơn giản (dùng ở đây)**: `Int` của Swift trên LeetCode là 64 bit, đảo một số 32 bit không bao giờ tràn 64 bit. Cứ đảo xong rồi so với `Int32.min/max`.
   - **Cách "đúng tinh thần đề"** (đề nói môi trường không lưu được số 64 bit): kiểm tra **trước** khi nhân, `res > Int32.max / 10` hoặc `res == Int32.max / 10 && chữ số > 7` thì trả `0` (tương tự cho phía âm với `-8`).

## Ý tưởng triển khai
- `var x = x` để che tham số (tham số hàm trong Swift là hằng).
- Điều kiện lặp là `x != 0` chứ không phải `x > 0`, để số âm cũng chạy.
- Số 0 ở cuối tự biến mất: `120 → 021 → 21` vì `res * 10 + 0` khi `res = 0` vẫn là `0`.
- Trong Swift, tràn số nguyên sẽ **crash** chứ không cuộn vòng như C — nên nếu dùng `Int32` thật thì bắt buộc phải kiểm tra trước khi nhân.

## Ghi nhớ
Bài thao tác chữ số: `% 10` và `/ 10`. Luôn tự hỏi "có tràn không?" và nhớ rằng Swift bẫy lỗi tràn lúc chạy.
