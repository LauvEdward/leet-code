---
id: 12
title: Integer to Roman
slug: integer-to-roman
difficulty: Medium
topics: Array / String, Hash Table, Math, Greedy
date: 2026-10-13
time: O(1)
space: O(1)
status: Accepted
---
## Đề bài
Đổi một số nguyên từ 1 đến 3999 sang số La Mã.

## Cơ sở lý thuyết
- **Tham lam theo mệnh giá**: giống bài đổi tiền với một hệ mệnh giá "chuẩn tắc" — luôn lấy mệnh giá lớn nhất còn vừa. Với số La Mã, tham lam cho đúng cách viết chuẩn.
- Mẹo then chốt: coi sáu dạng trừ (`CM`, `CD`, `XC`, `XL`, `IX`, `IV`) là **mệnh giá riêng**. Khi đó có 13 mệnh giá và không còn phải xử lý đặc biệt cho chữ số 4 hay 9.
- Số vòng lặp bị chặn bởi hằng số (số La Mã dài nhất trong khoảng này là `MMMDCCCLXXXVIII`, 15 ký tự) nên độ phức tạp là `O(1)`.

## Hướng xử lý
1. Bảng 13 cặp `(giá trị, ký hiệu)` xếp giảm dần.
2. Với mỗi cặp: chừng nào số còn `≥` giá trị thì nối ký hiệu vào kết quả và trừ đi.

## Ý tưởng triển khai
- Bảng là mảng tuple, duyệt bằng `for (v, r) in table`.
- Vòng `while n >= v` tự xử lý việc lặp ký hiệu (`MMM`, `CC`…); các mệnh giá trừ như `900` không bao giờ lặp vì sau khi trừ số còn lại nhỏ hơn mệnh giá đó.
- Test cục bộ: mọi số 1…3999 đổi sang rồi đổi ngược phải ra chính nó, và không có ký hiệu nào lặp quá số lần cho phép.

## Ví dụ chạy từng bước
**Input:** `num = 1994`
**Output:** `"MCMXCIV"`

```
n = 1994: 1994 >= 1000 → "M"        n = 994
n = 994:  994 >= 900   → "MCM"      n = 94
n = 94:   bỏ qua 500, 400, 100
          94 >= 90     → "MCMXC"    n = 4
n = 4:    bỏ qua 50, 40, 10, 9, 5
          4 >= 4       → "MCMXCIV"  n = 0
```

**Input:** `num = 3749` → **Output:** `"MMMDCCXLIX"`

```
3749 → MMM (còn 749) → D (249) → CC (49) → XL (9) → IX (0)
```

## Ghi nhớ
Khi quy tắc có ngoại lệ (dạng trừ), thử **đưa ngoại lệ vào bảng dữ liệu** thay vì viết nhánh `if` — code ngắn hơn và khó sai hơn.
