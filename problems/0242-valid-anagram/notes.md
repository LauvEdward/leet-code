---
id: 242
title: Valid Anagram
slug: valid-anagram
difficulty: Easy
topics: Hashmap, String, Sorting
date: 2026-10-18
time: O(n log n)
space: O(n)
status: Chưa nộp (LeetCode trong Chrome chưa đăng nhập)
---
## Đề bài
Kiểm tra `t` có phải là hoán vị các chữ cái (anagram) của `s` không.

## Cơ sở lý thuyết
- Hai chuỗi là anagram khi và chỉ khi chúng có **cùng đa tập ký tự**.
- Hai cách so đa tập:
   - **Sắp xếp** rồi so: hai đa tập bằng nhau ⟺ hai dãy đã sắp bằng nhau. `O(n log n)`, viết một dòng.
   - **Đếm tần suất**: `O(n)`, dùng khi cần nhanh hơn hoặc khi bảng chữ cái nhỏ (mảng 26 ô).

## Hướng xử lý
1. Sắp xếp các ký tự của cả hai chuỗi.
2. So sánh hai mảng kết quả.

## Ý tưởng triển khai
- `s.sorted() == t.sorted()` — `sorted()` trên `String` trả về `[Character]`.
- Khác độ dài thì hai mảng đã sắp chắc chắn khác nhau, không cần kiểm tra riêng.
- Câu hỏi thêm của đề (ký tự Unicode): cách sắp xếp vẫn đúng vì Swift so sánh `Character` theo cụm grapheme.

## Ví dụ chạy từng bước
**Input:** `s = "anagram"`, `t = "nagaram"`
**Output:** `true`

```
sorted(s) = [a, a, a, g, m, n, r]
sorted(t) = [a, a, a, g, m, n, r]
bằng nhau → true
```

**Input:** `s = "rat"`, `t = "car"`
**Output:** `false`

```
sorted(s) = [a, r, t]
sorted(t) = [a, c, r]
khác ở vị trí thứ 2 → false
```

## Ghi nhớ
"Cùng các phần tử, khác thứ tự" → sắp xếp để có dạng chuẩn, hoặc đếm. Dạng chuẩn sau khi sắp còn dùng được làm **khóa nhóm** (bài 49).
