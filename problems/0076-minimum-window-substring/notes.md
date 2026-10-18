---
id: 76
title: Minimum Window Substring
slug: minimum-window-substring
difficulty: Hard
topics: Sliding Window, Hash Table, String
date: 2026-10-18
time: O(|s| + |t|)
space: O(số loại ký tự)
status: Chưa nộp (LeetCode trong Chrome chưa đăng nhập)
---
## Đề bài
Cho hai chuỗi `s` và `t`. Tìm chuỗi con ngắn nhất của `s` chứa **mọi ký tự của `t`, tính cả số lần lặp**. Không có thì trả chuỗi rỗng.

## Cơ sở lý thuyết
- **Cửa sổ trượt với bảng đếm**: mở rộng biên phải cho tới khi cửa sổ "đủ", rồi co biên trái hết mức trong khi vẫn đủ. Mỗi ký tự vào và ra cửa sổ đúng một lần → tuyến tính.
- **Biến đếm "còn thiếu" (`missing`)**: thay vì so cả bảng đếm mỗi bước, giữ một số nguyên là tổng số ký tự của `t` chưa được đáp ứng. Cửa sổ đủ khi `missing == 0` — kiểm tra `O(1)`.
- Mẹo bảng `need`: giá trị **dương** nghĩa là còn cần, **âm** nghĩa là đang thừa (kể cả ký tự không có trong `t`). Một ký tự chỉ làm giảm `missing` khi nó đang được cần (`need > 0`).

## Hướng xử lý
1. `need[c]` = số lần `c` xuất hiện trong `t`; `missing = |t|`.
2. Duyệt `r`: nếu `need[s[r]] > 0` thì `missing -= 1`; sau đó luôn `need[s[r]] -= 1`.
3. Khi `missing == 0`: ghi nhận cửa sổ `[l, r]` nếu ngắn hơn; bỏ `s[l]` ra (`need += 1`), nếu nó trở thành dương thì cửa sổ hết đủ (`missing += 1`); tăng `l`. Lặp tới khi không còn đủ.
4. Trả về cửa sổ ngắn nhất đã ghi nhận.

## Ý tưởng triển khai
- `need: [Character: Int]` với `default: 0` để ký tự lạ tự có giá trị 0 rồi thành âm.
- Chỉ lưu `bestL`, `bestLen`; cắt chuỗi một lần ở cuối.
- `bestLen = Int.max` làm lính canh cho trường hợp không tìm được.
- Test cục bộ: đối chiếu độ dài với vét cạn và kiểm tra kết quả thật sự chứa đủ `t`.

## Ví dụ chạy từng bước
**Input:** `s = "ADOBECODEBANC"`, `t = "ABC"`
**Output:** `"BANC"`

Ban đầu `need = {A: 1, B: 1, C: 1}`, `missing = 3`. Chỉ số: `A0 D1 O2 B3 E4 C5 O6 D7 E8 B9 A10 N11 C12`.

```
r=0 'A': cần → missing=2      r=3 'B': cần → missing=1      r=5 'C': cần → missing=0
   → đủ: [0,5] "ADOBEC" dài 6 → best = 6
     bỏ 'A' → need[A]=1 > 0 → missing=1, l=1

r=6..9 ('O','D','E','B'): không làm giảm missing ('B' đang thừa, need[B] thành -1)
r=10 'A': cần → missing=0
   → đủ: [1,10] dài 10 · bỏ 'D' (l=2) · [2,10] dài 9 · bỏ 'O' (l=3)
         [3,10] dài 8 · bỏ 'B' → need[B]=0, vẫn đủ (l=4)
         [4,10] dài 7 · bỏ 'E' (l=5)
         [5,10] "CODEBA" dài 6 (không ngắn hơn) · bỏ 'C' → need[C]=1 → missing=1, l=6

r=11 'N': không đổi
r=12 'C': cần → missing=0
   → đủ: [6,12] dài 7 · bỏ 'O' (l=7) · [7,12] dài 6 · bỏ 'D' (l=8)
         [8,12] "EBANC" dài 5 → best = 5 · bỏ 'E' (l=9)
         [9,12] "BANC"  dài 4 → best = 4 · bỏ 'B' → need[B]=1 → missing=1, l=10
Hết chuỗi → "BANC"
```

**Input:** `s = "a"`, `t = "aa"` → **Output:** `""`

```
r=0 'a': need[a] = 2 > 0 → missing = 1 → không bao giờ về 0 → trả chuỗi rỗng
```

## Ghi nhớ
"Chuỗi con ngắn nhất chứa đủ…" → cửa sổ trượt + bảng đếm + biến `missing`. Khuôn này giải luôn bài 30 và 438 (tìm mọi hoán vị/anagram).
