---
id: 8
title: String to Integer (atoi)
slug: string-to-integer-atoi
difficulty: Medium
topics: String
date: 2026-10-09
time: O(n)
space: O(n) (mảng ký tự; có thể O(1) nếu duyệt trực tiếp)
status: Accepted
---
## Đề bài
Cài đặt `myAtoi(s)`: bỏ khoảng trắng đầu, đọc dấu `+`/`-` (nếu có), đọc các chữ số liên tiếp cho tới khi gặp ký tự khác, rồi kẹp kết quả vào khoảng số nguyên 32 bit.

## Cơ sở lý thuyết
- **Phân tích cú pháp tuần tự (parsing)**: đọc chuỗi một lượt từ trái sang phải qua các **pha** cố định. Về bản chất đây là một **máy trạng thái hữu hạn**: `khoảng trắng → dấu → chữ số → dừng`, và không bao giờ quay lại pha trước.
- **Tích lũy chữ số**: `res = res * 10 + d` (sơ đồ Horner).
- **Kẹp giá trị (clamp)**: `min(max(x, lo), hi)`.

## Hướng xử lý
Bài không khó về thuật toán, khó ở chỗ **làm đúng từng quy tắc theo đúng thứ tự**:
1. Bỏ qua mọi dấu cách ở đầu.
2. Đọc **tối đa một** dấu. `"+-12"` → `0` vì sau `+` là `-`, không phải chữ số.
3. Đọc chữ số đến khi gặp ký tự không phải số hoặc hết chuỗi. Không có chữ số nào → `0`.
4. Kẹp vào `[-2³¹, 2³¹ - 1]`.

Cạm bẫy: chuỗi có thể dài 200 ký tự toàn chữ số → tràn cả `Int` 64 bit nếu cứ cộng dồn.

## Ý tưởng triển khai
- Một con trỏ `i` chạy qua ba vòng/khối nối tiếp nhau, mỗi khối là một pha.
- **Chống tràn kiểu lười**: ngay khi `res > Int32.max` thì `break`. Lúc đó `res` nhiều nhất cỡ `2.1 × 10¹⁰`, còn rất xa giới hạn 64 bit; phần kẹp ở cuối sẽ đưa nó về đúng biên.
- `Character.wholeNumberValue` trả `Int?` — vừa kiểm tra "là chữ số" vừa lấy giá trị. Kèm `isASCII` để không nhận nhầm chữ số Unicode khác (ví dụ `"٣"`).
- Nhân dấu **sau cùng**, rồi kẹp: xử lý đúng cả `-2147483648`.

## Ví dụ chạy từng bước
**Input:** `s = "   -042"` → **Output:** `-42`

```
Pha 1 (khoảng trắng): bỏ 3 dấu cách       → i=3
Pha 2 (dấu):          gặp '-' → sign=-1   → i=4
Pha 3 (chữ số):       '0' → res=0
                      '4' → res=4
                      '2' → res=42        → hết chuỗi
res = 42 * (-1) = -42, nằm trong khoảng → trả về -42
```

**Input:** `s = "1337c0d3"` → **Output:** `1337`

```
Không có khoảng trắng, không có dấu.
'1' → 1, '3' → 13, '3' → 133, '7' → 1337, gặp 'c' → dừng đọc
Trả về 1337
```

**Input:** `s = "-91283472332"` → **Output:** `-2147483648`

```
sign = -1
9 → 91 → 912 → 9128 → 91283 → 912834 → 9128347 → 91283472 → 912834723
→ 9128347233 > 2147483647 → break (bỏ các chữ số còn lại)
res = -9128347233 → kẹp về Int32.min = -2147483648
```

**Input:** `s = "+-12"` → **Output:** `0` (sau `+` là `-`, không phải chữ số nên pha 3 không đọc được gì).

## Ghi nhớ
Với bài parsing, viết ra danh sách các pha rồi code từng pha một, kiểm tra `i < a.count` ở mọi chỗ truy cập. Thử các ca: rỗng, toàn dấu cách, chỉ có dấu, hai dấu liền nhau, tràn dương, tràn âm.
