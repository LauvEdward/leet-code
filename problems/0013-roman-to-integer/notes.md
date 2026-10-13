---
id: 13
title: Roman to Integer
slug: roman-to-integer
difficulty: Easy
topics: Array / String, Hash Table, Math
date: 2026-10-13
time: O(n)
space: O(1)
status: Accepted
---
## Đề bài
Đổi một số La Mã hợp lệ (trong khoảng 1 đến 3999) sang số nguyên.

## Cơ sở lý thuyết
- Số La Mã viết các ký hiệu theo giá trị **giảm dần** từ trái sang phải và cộng lại: `VIII = 5 + 1 + 1 + 1`.
- **Quy tắc trừ**: một ký hiệu nhỏ đứng **ngay trước** ký hiệu lớn hơn thì bị trừ đi. Chỉ có sáu trường hợp: `IV` (4), `IX` (9), `XL` (40), `XC` (90), `CD` (400), `CM` (900).
- Vì vậy chỉ cần **nhìn trước một ký tự** là biết ký hiệu hiện tại được cộng hay trừ.

## Hướng xử lý
1. Bảng tra giá trị của 7 ký hiệu.
2. Duyệt từng ký tự: nếu giá trị của nó **nhỏ hơn** giá trị ký tự kế tiếp thì trừ, ngược lại cộng.
3. Ký tự cuối cùng luôn được cộng.

## Ý tưởng triển khai
- `val: [Character: Int]` làm bảng tra; `Array(s)` để lấy chỉ số.
- Điều kiện `i + 1 < a.count && v < val[a[i + 1]]!` — kiểm tra biên trước khi nhìn sang phải.
- Force-unwrap `val[...]!` vì đề đảm bảo chuỗi chỉ gồm ký hiệu hợp lệ.
- Test cục bộ: đổi mọi số từ 1 đến 3999 sang La Mã rồi đổi ngược lại.

## Ví dụ chạy từng bước
**Input:** `s = "MCMXCIV"`
**Output:** `1994`

```
M (1000): sau là C (100)  → 1000 >= 100 → cộng → res = 1000
C (100):  sau là M (1000) → 100 < 1000  → trừ  → res = 900
M (1000): sau là X (10)   → cộng               → res = 1900
X (10):   sau là C (100)  → 10 < 100    → trừ  → res = 1890
C (100):  sau là I (1)    → cộng               → res = 1990
I (1):    sau là V (5)    → 1 < 5       → trừ  → res = 1989
V (5):    ký tự cuối      → cộng               → res = 1994
```

**Input:** `s = "LVIII"` → **Output:** `58`

```
L (50) + V (5) + I (1) + I (1) + I (1) = 58   (không có cặp trừ nào)
```

## Ghi nhớ
Chuỗi có quy tắc phụ thuộc ký tự kề bên → duyệt một lượt và nhìn trước một bước. Bài 12 là chiều ngược lại.
