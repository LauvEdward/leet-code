---
id: 68
title: Text Justification
slug: text-justification
difficulty: Hard
topics: Array / String, Simulation, Greedy
date: 2026-10-13
time: O(tổng số ký tự)
space: O(tổng số ký tự)
status: Accepted
---
## Đề bài
Cho danh sách từ và độ rộng `maxWidth`. Xếp chữ thành các dòng dài đúng `maxWidth`, căn đều hai bên: mỗi dòng nhét nhiều từ nhất có thể; dấu cách chia đều giữa các khe, phần dư dồn cho các khe **bên trái**. Dòng cuối và dòng chỉ có một từ thì căn trái.

## Cơ sở lý thuyết
- **Mô phỏng theo đặc tả**: không có thuật toán ẩn; độ khó nằm ở việc làm đúng từng quy tắc và các ca biên.
- **Tham lam chọn từ cho dòng**: nhét từ vào dòng hiện tại chừng nào còn vừa, tính cả ít nhất một dấu cách cho mỗi khe.
- **Chia đều có dư**: chia `spaces` dấu cách cho `gaps` khe → mỗi khe `spaces / gaps`, và `spaces % gaps` khe đầu tiên được thêm một.

## Hướng xử lý
1. Từ vị trí `i`, mở rộng `j` chừng nào `(tổng độ dài các từ) + (số khe tối thiểu) ≤ maxWidth`. Dòng gồm các từ `i ..< j`.
2. Nếu là dòng cuối (`j == n`) hoặc chỉ có một từ (`gaps == 0`): nối bằng một dấu cách, đệm dấu cách vào bên phải cho đủ độ rộng.
3. Ngược lại: `spaces = maxWidth - len`, `each = spaces / gaps`, `extra = spaces % gaps`; khe thứ `t` (đếm từ 0) nhận `each + 1` dấu cách nếu `t < extra`, không thì `each`.
4. Tiếp tục với `i = j`.

## Ý tưởng triển khai
- Điều kiện nhét thêm từ: `len + words[j].count + (j - i) <= maxWidth`, trong đó `j - i` là số khe nếu thêm từ `j`.
- Phải xét `gaps == 0` riêng để tránh **chia cho 0**.
- `String(repeating: " ", count:)` tạo dãy dấu cách.
- Test cục bộ: ba ví dụ của đề, và kiểm tra tính chất trên dữ liệu ngẫu nhiên (mọi dòng dài đúng `maxWidth`, thứ tự từ giữ nguyên).

## Ví dụ chạy từng bước
**Input:** `words = ["This", "is", "an", "example", "of", "text", "justification."]`, `maxWidth = 16`
**Output:**

```
"This    is    an"
"example  of text"
"justification.  "
```

Diễn biến:

```
Dòng 1 (i=0):
   "This": 0 + 4 + 0 = 4 <= 16   → len=4,  j=1
   "is":   4 + 2 + 1 = 7 <= 16   → len=6,  j=2
   "an":   6 + 2 + 2 = 10 <= 16  → len=8,  j=3
   "example": 8 + 7 + 3 = 18 > 16 → dừng
   gaps = 2, spaces = 16 - 8 = 8 → each = 4, extra = 0
   → "This" + 4 cách + "is" + 4 cách + "an"

Dòng 2 (i=3):
   "example": len=7, j=4 · "of": 7 + 2 + 1 = 10 → len=9, j=5
   "text": 9 + 4 + 2 = 15 <= 16 → len=13, j=6
   "justification.": 13 + 14 + 3 > 16 → dừng
   gaps = 2, spaces = 16 - 13 = 3 → each = 1, extra = 1
   → "example" + 2 cách (khe đầu được thêm 1) + "of" + 1 cách + "text"

Dòng 3 (i=6):
   "justification.": len=14, j=7 = n → dòng cuối, căn trái
   → "justification." + 2 cách đệm bên phải
```

## Ghi nhớ
Bài mô phỏng "Hard" kiểu này ăn nhau ở sự cẩn thận: liệt kê các ca đặc biệt (dòng cuối, dòng một từ, chia có dư) **trước khi** viết code, rồi viết từng ca một.
