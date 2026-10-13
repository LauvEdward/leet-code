---
id: 125
title: Valid Palindrome
slug: valid-palindrome
difficulty: Easy
topics: Two Pointers, String
date: 2026-10-13
time: O(n)
space: O(n)
status: Accepted
---
## Đề bài
Sau khi đổi hết sang chữ thường và bỏ mọi ký tự không phải chữ hoặc số, chuỗi `s` có đọc xuôi ngược như nhau không?

## Cơ sở lý thuyết
- **Chuẩn hóa rồi so sánh**: tách bài toán thành hai bước độc lập — làm sạch dữ liệu, rồi kiểm tra palindrome trên chuỗi sạch.
- **Hai con trỏ từ hai đầu** là cách kiểm tra palindrome tại chỗ: so `a[l]` với `a[r]` rồi tiến vào trong; có thể kết hợp bỏ qua ký tự không hợp lệ ngay trong lúc duyệt để đạt `O(1)` bộ nhớ.
- Chuỗi rỗng (sau khi lọc) được coi là palindrome.

## Hướng xử lý
1. Đổi sang chữ thường, lọc giữ lại chữ cái và chữ số.
2. So chuỗi đã lọc với bản đảo ngược của nó.

## Ý tưởng triển khai
- `s.lowercased().filter { $0.isLetter || $0.isNumber }` — `filter` trên `String` trả về `String`.
- `a == String(a.reversed())`.
- Cách này tốn thêm `O(n)` bộ nhớ nhưng rất khó viết sai; bản hai con trỏ dành cho khi bị hỏi tối ưu bộ nhớ.

## Ví dụ chạy từng bước
**Input:** `s = "A man, a plan, a canal: Panama"`
**Output:** `true`

```
lowercased → "a man, a plan, a canal: panama"
lọc        → "amanaplanacanalpanama"
đảo ngược  → "amanaplanacanalpanama"
bằng nhau  → true
```

**Input:** `s = "race a car"`
**Output:** `false`

```
lọc        → "raceacar"
đảo ngược  → "racaecar"
khác nhau  → false
```

**Input:** `s = " "` → **Output:** `true` (lọc xong còn chuỗi rỗng).

**Input:** `s = "0P"` → **Output:** `false` (chữ số cũng được giữ: `"0p"` khác `"p0"`).

## Ghi nhớ
Đọc kỹ "ký tự nào được tính": ở đây là chữ **và số**. Ca `"0P"` là bẫy quen thuộc cho ai chỉ giữ chữ cái.
