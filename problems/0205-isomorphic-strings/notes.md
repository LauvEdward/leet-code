---
id: 205
title: Isomorphic Strings
slug: isomorphic-strings
difficulty: Easy
topics: Hashmap, String
date: 2026-10-18
time: O(n)
space: O(số loại ký tự)
status: Chưa nộp (LeetCode trong Chrome chưa đăng nhập)
---
## Đề bài
Hai chuỗi `s`, `t` cùng độ dài là *đẳng cấu* nếu có thể thay mỗi ký tự của `s` bằng một ký tự (cố định) để được `t`, sao cho hai ký tự khác nhau không bị thay bằng cùng một ký tự.

## Cơ sở lý thuyết
- Đẳng cấu nghĩa là tồn tại một **song ánh** (ánh xạ một-một) giữa các ký tự của `s` và các ký tự của `t`, áp dụng nhất quán ở mọi vị trí.
- Chỉ kiểm tra một chiều (`s → t`) là **không đủ**: `"ab"` và `"aa"` có ánh xạ `a→a, b→a` hợp lệ theo chiều đó nhưng hai ký tự khác nhau lại cùng thành `a`. Phải kiểm tra cả chiều ngược `t → s`.
- Cách nhìn khác: hai chuỗi đẳng cấu khi chúng có cùng "mẫu", ví dụ thay mỗi ký tự bằng vị trí xuất hiện đầu tiên của nó (`"egg"` và `"add"` đều thành `[0, 1, 1]`) — dùng trong test cục bộ.

## Hướng xử lý
1. Hai bảng băm `st` (ký tự của `s` → ký tự của `t`) và `ts` (chiều ngược).
2. Tại mỗi vị trí `i`: nếu `st[s[i]]` đã có mà khác `t[i]` → `false`; nếu `ts[t[i]]` đã có mà khác `s[i]` → `false`.
3. Ghi nhận cả hai chiều rồi đi tiếp.

## Ý tưởng triển khai
- `if let x = st[a[i]], x != b[i] { return false }` — điều kiện kép gọn trong một dòng.
- Gán lại một giá trị giống hệt (khi ánh xạ đã có và đúng) là vô hại, không cần kiểm tra trước khi gán.

## Ví dụ chạy từng bước
**Input:** `s = "paper"`, `t = "title"`
**Output:** `true`

```
i=0: p → t (mới)          st = {p:t},           ts = {t:p}
i=1: a → i (mới)          st = {p:t, a:i},      ts = {t:p, i:a}
i=2: p → t (khớp st[p]=t, ts[t]=p)
i=3: e → l (mới)          st = {…, e:l},        ts = {…, l:e}
i=4: r → e (mới)          st = {…, r:e},        ts = {…, e:r}
→ true
```

**Input:** `s = "badc"`, `t = "baba"`
**Output:** `false`

```
i=0: b → b      i=1: a → a
i=2: d → b: st[d] chưa có, nhưng ts[b] = b ≠ d → false
   (hai ký tự b và d không được cùng thành b)
```

## Ghi nhớ
Bài "ánh xạ nhất quán giữa hai dãy" → hai bảng băm cho hai chiều. Bài 290 (Word Pattern) là cùng một bài với đơn vị là từ thay cho ký tự.
