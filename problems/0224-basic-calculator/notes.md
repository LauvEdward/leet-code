---
id: 224
title: Basic Calculator
slug: basic-calculator
difficulty: Hard
topics: Stack, Math, String, Recursion
date: 2026-10-19
time: O(n)
space: O(n)
status: Chưa nộp (LeetCode trong Chrome chưa đăng nhập)
---
## Đề bài
Tính giá trị biểu thức gồm số nguyên không âm, `+`, `-`, dấu ngoặc `(` `)` và dấu cách. Dấu `-` có thể là dấu âm một ngôi (ví dụ `-(2 + 3)`, `-2 + 1`). Không được dùng hàm `eval`.

## Cơ sở lý thuyết
- Chỉ có cộng và trừ nên **không có độ ưu tiên** giữa các toán tử; mọi khó khăn nằm ở dấu ngoặc. Một biểu thức chỉ có `+`, `-` là tổng có dấu của các số: `res = Σ dấu × số`.
- **Ngoặc = biểu thức con**: khi gặp `(`, tạm cất kết quả đang tính và dấu đứng trước ngoặc vào **ngăn xếp**, tính biểu thức con từ đầu; gặp `)` thì lấy ra: `kết quả_cũ + dấu × kết quả_con`. Đây là cách khử đệ quy bằng ngăn xếp.
- Dấu `-` một ngôi tự được xử lý: nó chỉ là dấu trừ đứng trước một số `0` ngầm định (`res` đang bằng 0).

## Hướng xử lý
Giữ ba biến: `res` (tổng của mức hiện tại), `num` (số đang đọc dở), `sign` (dấu của `num`).
1. Chữ số → `num = num * 10 + d`.
2. `+` hoặc `-` → cộng `sign * num` vào `res`, đặt lại `num = 0`, `sign` theo dấu vừa gặp.
3. `(` → đẩy `res` rồi `sign` vào ngăn xếp; bắt đầu mức mới `res = 0`, `sign = 1`.
4. `)` → chốt số cuối của mức trong: `res += sign * num`; rồi `res = res * dấu_đã_cất + res_đã_cất`.
5. Dấu cách → bỏ qua.
6. Kết thúc: `res + sign * num`.

## Ý tưởng triển khai
- Ngăn xếp `[Int]` chứa xen kẽ `res`, `sign`; khi lấy ra thì lấy dấu trước (nằm trên), rồi tới kết quả cũ.
- `c.wholeNumberValue` nhận diện chữ số và lấy giá trị cùng lúc.
- Đặt `num = 0` sau khi gặp `)` để số đã dùng không bị cộng lần nữa.
- Test cục bộ: sinh ngẫu nhiên 3000 biểu thức lồng ngoặc (có cả `-(…)`) cùng giá trị đúng để so.

## Ví dụ chạy từng bước
**Input:** `s = "(1+(4+5+2)-3)+(6+8)"`
**Output:** `23`

```
'(' : cất (0, +1)          st = [0, 1]            res = 0, sign = +1
'1' : num = 1
'+' : res = 0 + 1 = 1      num = 0, sign = +1
'(' : cất (1, +1)          st = [0, 1, 1, 1]      res = 0, sign = +1
'4' '+' : res = 4 · '5' '+' : res = 9 · '2' : num = 2
')' : res = 9 + 2 = 11 → res = 11 × (+1) + 1 = 12    st = [0, 1]
'-' : res = 12 + 0 = 12    sign = -1
'3' : num = 3
')' : res = 12 - 3 = 9 → res = 9 × (+1) + 0 = 9      st = []
'+' : res = 9              sign = +1
'(' : cất (9, +1)          res = 0
'6' '+' : res = 6 · '8' : num = 8
')' : res = 6 + 8 = 14 → res = 14 × (+1) + 9 = 23
Hết chuỗi: 23 + (+1) × 0 = 23
```

**Input:** `s = "1-(     -2)"` → **Output:** `3`

```
'1' : num = 1
'-' : res = 1, sign = -1
'(' : cất (1, -1), res = 0, sign = +1
'-' : res = 0 + 0 = 0, sign = -1     (dấu âm một ngôi)
'2' : num = 2
')' : res = 0 - 2 = -2 → res = -2 × (-1) + 1 = 3
```

## Ghi nhớ
Biểu thức trung tố có ngoặc → ngăn xếp cất trạng thái của mức ngoài mỗi khi gặp `(`. Khi có thêm `*` `/` (bài 227, 772), cần thêm xử lý độ ưu tiên: tính ngay phép nhân chia, chỉ hoãn cộng trừ.
