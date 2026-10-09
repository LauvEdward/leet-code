---
id: 4073
title: Count Good Strings
slug: count-good-strings
difficulty: Hard
topics: Weekly Contest 522, Math, Combinatorics, Fibonacci, Fast Doubling
date: 2026-10-09
time: O(log n)
space: O(log n) (ngăn xếp đệ quy)
status: Accepted
---
## Đề bài
Một chuỗi chỉ gồm `a`, `b` là *good* nếu: (1) nó chỉ có một loại ký tự và độ dài lẻ; hoặc (2) nó ghép được từ hai chuỗi good khác rỗng `s1 + s2` mà ký tự cuối của `s1` khác ký tự đầu của `s2`. Đếm số chuỗi good độ dài `n` (`n ≤ 10¹⁵`), lấy dư cho `10⁹ + 7`.

## Cơ sở lý thuyết
- **Đoạn chạy (run)**: một dãy tối đa các ký tự giống nhau liên tiếp. Mọi chuỗi nhị phân được xác định duy nhất bởi ký tự đầu và dãy độ dài các run.
- **Hợp số (composition)**: cách viết `n` thành tổng **có thứ tự** của các số nguyên dương. Kết quả kinh điển: số hợp số của `n` chỉ gồm các **số lẻ** bằng số Fibonacci `F(n)` (với `F(1) = F(2) = 1`).
- **Fast doubling** tính `F(n)` trong `O(log n)` nhờ hai đẳng thức:
   - `F(2k) = F(k) · (2·F(k+1) − F(k))`
   - `F(2k+1) = F(k)² + F(k+1)²`
- **Số học modulo**: với `M ≈ 10⁹`, tích hai số nhỏ hơn `M` nhỏ hơn `10¹⁸`, vẫn vừa `Int` 64 bit (`≈ 9.2 × 10¹⁸`).

## Hướng xử lý
1. **Đơn giản hóa định nghĩa.** Quy tắc (2) chỉ cho cắt ở chỗ hai ký tự kề nhau khác nhau — tức **ranh giới giữa hai run**. Cắt đệ quy tới cùng, mỗi mảnh cơ sở là một run nguyên vẹn và theo quy tắc (1) phải có độ dài lẻ. Ngược lại, chuỗi nào có mọi run lẻ thì cứ tách run đầu ra là chứng minh được nó good bằng quy nạp. Vậy:

   **good ⟺ mọi run đều có độ dài lẻ.**
2. **Đếm.** Chọn ký tự đầu (2 cách), rồi chọn dãy độ dài các run — một hợp số của `n` thành các số lẻ. Đáp án là `2 · F(n)`.
3. **Vì sao là Fibonacci:** gọi `c(n)` là số hợp số lẻ của `n`. Phần tử đầu là `1` (còn `c(n-1)` cách), hoặc lớn hơn `1` — khi đó trừ nó đi `2` vẫn là số lẻ dương, cho một hợp số lẻ của `n - 2` (`c(n-2)` cách). Nên `c(n) = c(n-1) + c(n-2)`.
4. **Kiểm tra với ví dụ:** `n = 2 → 2·1 = 2`, `n = 3 → 2·2 = 4`, `n = 4 → 2·3 = 6`. Khớp.
5. `n` tới `10¹⁵` nên không lặp tuyến tính được → fast doubling (hoặc lũy thừa ma trận `2×2`).

## Ý tưởng triển khai
- `fib(n)` đệ quy trả về cặp `(F(n), F(n+1))`: gọi `fib(n / 2)` lấy `(a, b)`, tính `c = F(2k)`, `d = F(2k+1)`; nếu `n` chẵn trả `(c, d)`, lẻ trả `(d, c + d)`.
- `2 * b - a + M` trước khi `% M` để không ra số âm.
- Độ sâu đệ quy chỉ khoảng `log₂(10¹⁵) ≈ 50`.
- Test cục bộ: hàm `good` viết đúng theo định nghĩa đệ quy của đề, vét cạn mọi chuỗi độ dài `≤ 14` để xác nhận công thức `2·F(n)`; rồi đối chiếu fast doubling với vòng lặp thường tới `n = 5000`.

## Ghi nhớ
Bài đếm với `n` khổng lồ (`10¹⁵`, `10¹⁸`) → đáp án gần như chắc chắn là một công thức đóng hoặc truy hồi tuyến tính tính bằng lũy thừa nhanh. Cách tìm: viết vét cạn cho `n` nhỏ, nhìn dãy số (`2, 2, 4, 6, 10, 16…` — Fibonacci nhân đôi), rồi mới chứng minh. Định nghĩa đệ quy rắc rối thường rút gọn được thành một tính chất cấu trúc đơn giản.
