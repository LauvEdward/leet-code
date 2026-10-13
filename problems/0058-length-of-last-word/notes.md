---
id: 58
title: Length of Last Word
slug: length-of-last-word
difficulty: Easy
topics: Array / String
date: 2026-10-13
time: O(n)
space: O(n)
status: Accepted
---
## Đề bài
Cho chuỗi `s` gồm chữ cái và dấu cách (có ít nhất một từ). Trả về độ dài của từ cuối cùng.

## Cơ sở lý thuyết
- **Tách chuỗi (split)**: `split(separator:)` của Swift mặc định **bỏ các đoạn rỗng** (`omittingEmptySubsequences: true`), nên nhiều dấu cách liền nhau hay dấu cách ở đầu/cuối đều không tạo ra từ rỗng.
- Cách tiết kiệm bộ nhớ: duyệt từ **cuối** chuỗi, bỏ qua dấu cách rồi đếm tới khi gặp dấu cách kế tiếp — `O(1)` bộ nhớ.

## Hướng xử lý
1. Tách chuỗi theo dấu cách.
2. Lấy phần tử cuối và đếm độ dài.

## Ý tưởng triển khai
- Một dòng: `s.split(separator: " ").last!.count`.
- `last!` an toàn vì đề đảm bảo có ít nhất một từ.
- Cách này tạo mảng các `Substring` (không sao chép ký tự), đủ nhanh với `n ≤ 10⁴`.

## Ví dụ chạy từng bước
**Input:** `s = "   fly me   to   the moon  "`
**Output:** `4`

```
split theo " " (bỏ đoạn rỗng) → ["fly", "me", "to", "the", "moon"]
last → "moon"
count → 4
```

**Input:** `s = "Hello World"` → **Output:** `5`

```
["Hello", "World"] → "World" → 5
```

**Input:** `s = "a "` → **Output:** `1` (dấu cách cuối không tạo ra từ rỗng).

## Ghi nhớ
Với bài xử lý từ trong câu, nắm chắc hành vi của `split` về đoạn rỗng — ở Swift mặc định là bỏ, khác với `components(separatedBy:)` của Foundation (giữ lại chuỗi rỗng).
