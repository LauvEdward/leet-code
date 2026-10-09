---
id: 10
title: Regular Expression Matching
slug: regular-expression-matching
difficulty: Hard
topics: String, Dynamic Programming, Recursion
date: 2026-10-09
time: O(m · n)
space: O(m · n)
status: Accepted
---
## Đề bài
Cho chuỗi `s` và mẫu `p`, cài đặt so khớp biểu thức chính quy hỗ trợ `.` (khớp một ký tự bất kỳ) và `*` (khớp **0 hoặc nhiều** lần ký tự đứng ngay trước). Phải khớp **toàn bộ** `s`.

## Cơ sở lý thuyết
- **Quy hoạch động (DP)** áp dụng khi bài toán có *cấu trúc con tối ưu* và *bài toán con gối nhau*. Ở đây: "`s[i...]` có khớp `p[j...]` không" chỉ phụ thuộc vào các hậu tố ngắn hơn, và cùng một cặp `(i, j)` bị hỏi lại rất nhiều lần nếu đệ quy ngây thơ.
- `*` không đứng một mình: nó luôn đi kèm ký tự ngay trước, tạo thành một **đơn vị** `x*` nghĩa là "không, một hoặc nhiều `x`".
- Đệ quy quay lui thuần có thể mất thời gian **hàm mũ** (ví dụ `s = "aaaaaaaaaaaab"`, `p = "a*a*a*a*c"`); ghi nhớ kết quả theo `(i, j)` đưa về `O(m · n)`.

## Hướng xử lý
Định nghĩa `dp[i][j]` = `s[i...]` khớp `p[j...]`. Xét ký tự mẫu `p[j]`:

1. Gọi `first` = ký tự đầu khớp nhau: `i < m` và (`p[j] == s[i]` hoặc `p[j] == "."`).
2. **Nếu sau `p[j]` là `*`** — có hai lựa chọn, chỉ cần một cái đúng:
   - *Dùng 0 lần*: bỏ cả cụm `x*` → `dp[i][j + 2]`.
   - *Dùng thêm 1 lần*: cần `first`, tiêu một ký tự của `s` nhưng **giữ nguyên `j`** để cụm `x*` còn dùng tiếp được → `dp[i + 1][j]`.
3. **Nếu không có `*`**: bắt buộc khớp đúng một ký tự → `first && dp[i + 1][j + 1]`.

Trường hợp gốc: `dp[m][n] = true` (cả hai cùng hết). Còn `dp[i][n]` với `i < m` là `false` (mẫu hết mà chuỗi còn).

## Ý tưởng triển khai
- Bảng `(m + 1) × (n + 1)`, điền **từ dưới lên, từ phải sang trái** vì mỗi ô phụ thuộc vào `i + 1` và `j + 1`, `j + 2`.
- `i` phải chạy từ `m` (chuỗi rỗng) chứ không phải `m - 1`: chuỗi rỗng vẫn có thể khớp mẫu như `a*b*`.
- `j` chạy từ `n - 1`; cột `j = n` giữ giá trị khởi tạo.
- Kiểm tra `i < m` trong `first` đảm bảo không bao giờ đọc `dp[m + 1][…]`, vì nhánh đó bị `&&` chặn lại.
- Có thể nén còn hai hàng để giảm bộ nhớ xuống `O(n)`, nhưng bảng đầy đủ dễ đọc và dễ debug hơn.

## Ví dụ chạy từng bước
**Input:** `s = "aab"`, `p = "c*a*b"`
**Output:** `true`

`dp[i][j]` trả lời: `s[i...]` có khớp `p[j...]` không. Bảng được điền từ dưới lên; dưới đây là các ô nằm trên đường dẫn tới đáp án:

```
dp[3][5]: ""    vs ""       → cả hai cùng hết                          → true
dp[2][4]: "b"   vs "b"      → 'b' == 'b', xét tiếp dp[3][5]            → true
dp[2][2]: "b"   vs "a*b"    → bỏ qua "a*", xét dp[2][4]                → true
dp[1][2]: "ab"  vs "a*b"    → "a*" ăn 'a', ở lại j=2, xét dp[2][2]     → true
dp[0][2]: "aab" vs "a*b"    → "a*" ăn 'a', ở lại j=2, xét dp[1][2]     → true
dp[0][0]: "aab" vs "c*a*b"  → bỏ qua "c*" (dùng 0 lần), xét dp[0][2]   → true
```

Toàn bộ bảng (`T` = true, `.` = false), cột là `j`, hàng là `i`:

```
            j=0   1   2   3   4   5
p[j...]  =  c*a*b      a*b     b   ""
i=0 "aab"    T    .   T   .   .   .
i=1 "ab"     T    .   T   .   .   .
i=2 "b"      T    .   T   .   T   .
i=3 ""       .    .   .   .   .   T
```

**Input:** `s = "aa"`, `p = "a"` → **Output:** `false`

```
dp[2][1] = true
dp[1][0]: "a"  vs "a" → khớp, xét dp[2][1] → true
dp[0][0]: "aa" vs "a" → khớp 'a', xét dp[1][1]: "a" vs "" → false
→ false (mẫu hết mà chuỗi còn)
```

## Ghi nhớ
So khớp hai chuỗi (regex, wildcard, edit distance, LCS) → DP hai chiều trên cặp chỉ số `(i, j)`. Với `*`, nghĩ theo cụm `x*` và hai lựa chọn "bỏ qua" / "ăn thêm một ký tự, ở lại chỗ cũ".
