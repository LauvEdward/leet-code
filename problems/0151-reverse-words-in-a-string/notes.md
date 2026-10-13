---
id: 151
title: Reverse Words in a String
slug: reverse-words-in-a-string
difficulty: Medium
topics: Array / String, Two Pointers
date: 2026-10-13
time: O(n)
space: O(n)
status: Accepted
---
## Đề bài
Đảo thứ tự các từ trong chuỗi `s`. Kết quả chỉ có đúng một dấu cách giữa các từ, không có dấu cách thừa ở đầu, cuối.

## Cơ sở lý thuyết
- **Chuỗi biến đổi split → reverse → join**: tách thành các từ, đảo mảng, ghép lại bằng một dấu cách. Mỗi bước là `O(n)`.
- `split` của Swift bỏ đoạn rỗng nên dấu cách thừa tự biến mất; `joined(separator: " ")` chỉ chèn dấu cách **giữa** các phần tử.
- Cách tại chỗ (cho ngôn ngữ có chuỗi sửa được): đảo cả chuỗi rồi đảo từng từ — cùng mẹo "ba lần đảo" của bài 189.

## Hướng xử lý
1. `split(separator: " ")` → mảng các từ.
2. `reversed()`.
3. `joined(separator: " ")`.

## Ý tưởng triển khai
- Một dòng nối ba phép gọi.
- `reversed()` trên mảng trả về một view lười (không sao chép), `joined` duyệt qua nó.

## Ví dụ chạy từng bước
**Input:** `s = "  hello world  "`
**Output:** `"world hello"`

```
split    → ["hello", "world"]      (dấu cách đầu, cuối bị bỏ)
reversed → ["world", "hello"]
joined   → "world hello"
```

**Input:** `s = "a good   example"`
**Output:** `"example good a"`

```
split    → ["a", "good", "example"]   (ba dấu cách liền nhau không tạo từ rỗng)
reversed → ["example", "good", "a"]
joined   → "example good a"
```

## Ghi nhớ
Khi phỏng vấn, nói rõ có cách dùng thư viện (ngắn) và cách tại chỗ (đảo toàn bộ rồi đảo từng từ) — người hỏi thường muốn nghe cách thứ hai.
