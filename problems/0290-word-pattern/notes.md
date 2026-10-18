---
id: 290
title: Word Pattern
slug: word-pattern
difficulty: Easy
topics: Hashmap, String
date: 2026-10-18
time: O(n)
space: O(n)
status: Chưa nộp (LeetCode trong Chrome chưa đăng nhập)
---
## Đề bài
Cho mẫu `pattern` (các chữ cái) và chuỗi `s` (các từ cách nhau bởi dấu cách). Kiểm tra `s` có theo đúng mẫu không: tồn tại một song ánh giữa chữ cái trong mẫu và từ trong `s`.

## Cơ sở lý thuyết
- Giống hệt bài 205 (Isomorphic Strings): kiểm tra **song ánh**, nên cần hai bảng băm cho hai chiều. Khác biệt duy nhất là một phía là **từ** thay cho ký tự.
- Điều kiện cần trước tiên: số chữ cái trong mẫu phải bằng số từ.

## Hướng xử lý
1. Tách `s` thành các từ; nếu số từ khác độ dài mẫu → `false`.
2. Hai bảng `pw` (chữ cái → từ) và `wp` (từ → chữ cái).
3. Tại mỗi vị trí: mâu thuẫn với ánh xạ đã có ở chiều nào cũng → `false`.

## Ý tưởng triển khai
- `s.split(separator: " ").map(String.init)` — đổi `Substring` sang `String` để làm khóa bảng băm cho gọn.
- Kiểm tra độ dài trước để tránh truy cập ngoài mảng.

## Ví dụ chạy từng bước
**Input:** `pattern = "abba"`, `s = "dog cat cat dog"`
**Output:** `true`

```
Từ: [dog, cat, cat, dog], độ dài 4 = 4
i=0: a ↔ dog (mới)
i=1: b ↔ cat (mới)
i=2: b → cat ✓, cat → b ✓
i=3: a → dog ✓, dog → a ✓
→ true
```

**Input:** `pattern = "abba"`, `s = "dog dog dog dog"`
**Output:** `false`

```
i=0: a ↔ dog
i=1: b: pw[b] chưa có, nhưng wp[dog] = a ≠ b → false
```

**Input:** `pattern = "aaa"`, `s = "aa aa aa aa"` → **Output:** `false` (3 chữ cái nhưng 4 từ).

## Ghi nhớ
Kiểm tra song ánh = hai bảng băm. Đừng quên điều kiện độ dài trước khi ghép cặp.
