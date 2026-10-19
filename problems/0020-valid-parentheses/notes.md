---
id: 20
title: Valid Parentheses
slug: valid-parentheses
difficulty: Easy
topics: Stack, String
date: 2026-10-19
time: O(n)
space: O(n)
status: Chưa nộp (LeetCode trong Chrome chưa đăng nhập)
---
## Đề bài
Chuỗi chỉ gồm `()[]{}`. Kiểm tra mọi ngoặc mở đều được đóng bằng đúng loại, theo đúng thứ tự lồng nhau.

## Cơ sở lý thuyết
- **Ngăn xếp (stack) — vào sau ra trước**: ngoặc mở gần nhất chưa được đóng phải là ngoặc được đóng tiếp theo. Đó chính là phần tử trên đỉnh ngăn xếp.
- Cấu trúc ngoặc lồng nhau là ví dụ kinh điển của **ngôn ngữ phi ngữ cảnh**: không thể kiểm tra chỉ bằng bộ đếm khi có nhiều loại ngoặc (`([)]` có số lượng cân bằng nhưng sai thứ tự).

## Hướng xử lý
1. Gặp ngoặc mở → đẩy vào ngăn xếp.
2. Gặp ngoặc đóng → lấy đỉnh ra; nếu ngăn xếp rỗng hoặc đỉnh không phải ngoặc mở tương ứng → sai.
3. Hết chuỗi → hợp lệ khi ngăn xếp rỗng (không còn ngoặc mở thừa).

## Ý tưởng triển khai
- Bảng `pair` ánh xạ ngoặc đóng → ngoặc mở; `pair[c] != nil` nghĩa là `c` là ngoặc đóng.
- `st.popLast() != open` gộp hai trường hợp sai: ngăn xếp rỗng (`popLast()` trả `nil`) và sai loại.
- Test cục bộ đối chiếu với cách "xóa dần các cặp kề nhau `()`, `[]`, `{}`".

## Ví dụ chạy từng bước
**Input:** `s = "{[]}"` → **Output:** `true`

```
'{' → mở → st = [{]
'[' → mở → st = [{, []
']' → đóng, cần '[' → pop '[' ✓ → st = [{]
'}' → đóng, cần '{' → pop '{' ✓ → st = []
Hết chuỗi, st rỗng → true
```

**Input:** `s = "([)]"` → **Output:** `false`

```
'(' → st = [(]
'[' → st = [(, []
')' → đóng, cần '(' → pop ra '[' ≠ '(' → false
```

**Input:** `s = "("` → **Output:** `false` (hết chuỗi mà ngăn xếp còn `(`).

**Input:** `s = ")"` → **Output:** `false` (`popLast()` trên ngăn xếp rỗng trả `nil`).

## Ghi nhớ
Cấu trúc lồng nhau, "cái mở gần nhất phải đóng trước" → ngăn xếp. Đừng quên kiểm tra ngăn xếp rỗng ở cuối.
