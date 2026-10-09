---
id: 9
title: Palindrome Number
slug: palindrome-number
difficulty: Easy
topics: Math
date: 2026-10-09
time: O(log x) (số chữ số)
space: O(1)
status: Accepted
---
## Đề bài
Cho số nguyên `x`, trả về `true` nếu `x` đọc xuôi ngược như nhau. Câu hỏi thêm: làm mà không chuyển sang chuỗi.

## Cơ sở lý thuyết
- Một số là **palindrome** khi dãy chữ số thập phân của nó đối xứng.
- **Đảo số bằng số học**: lặp `rev = rev * 10 + n % 10; n /= 10` — cùng kỹ thuật với bài 7 (Reverse Integer).
- Số âm không bao giờ là palindrome vì dấu `-` chỉ nằm ở một đầu (`-121` đọc ngược là `121-`).

## Hướng xử lý
1. Cách nhanh nhất để viết: `String(x) == String(String(x).reversed())`. Đúng, nhưng tốn bộ nhớ cho chuỗi.
2. Cách số học: đảo toàn bộ `x` rồi so với chính nó.
3. Tối ưu thêm (không bắt buộc): chỉ đảo **nửa sau** — dừng khi `rev >= n`, rồi so `n == rev` (số chữ số chẵn) hoặc `n == rev / 10` (lẻ). Cách này tránh hẳn nguy cơ tràn, nhưng phải loại riêng các số tận cùng bằng `0`.

## Ý tưởng triển khai
- Loại số âm ngay đầu hàm.
- Đảo cả số cho đơn giản. Với `Int` 64 bit của Swift, đảo một số 32 bit không thể tràn nên không cần kiểm tra gì thêm.
- Giữ nguyên `x` để so sánh, làm việc trên bản sao `n`.
- `x = 0` → vòng lặp không chạy, `rev = 0 == x` → `true`. Các số tận cùng bằng 0 như `10` → `rev = 1 ≠ 10` → `false`, tự đúng.

## Ví dụ chạy từng bước
**Input:** `x = 121` → **Output:** `true`

```
n=121, rev=0  → rev = 1,   n = 12
n=12,  rev=1  → rev = 12,  n = 1
n=1,   rev=12 → rev = 121, n = 0 → dừng
rev == x (121 == 121) → true
```

**Input:** `x = 10` → **Output:** `false`

```
n=10, rev=0 → rev = 0, n = 1
n=1,  rev=0 → rev = 1, n = 0 → dừng
rev == x ? 1 ≠ 10 → false
```

**Input:** `x = -121` → **Output:** `false` (số âm bị loại ngay ở dòng đầu).

## Ghi nhớ
Bài dễ nhưng là dịp ôn mẫu "tách và ghép chữ số". Nếu ngôn ngữ dùng số 32 bit thật thì dùng biến thể "đảo nửa sau" để khỏi lo tràn.
