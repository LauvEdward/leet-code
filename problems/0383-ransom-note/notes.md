---
id: 383
title: Ransom Note
slug: ransom-note
difficulty: Easy
topics: Hashmap, String, Counting
date: 2026-10-18
time: O(|r| + |m|)
space: O(số loại ký tự)
status: Chưa nộp (LeetCode trong Chrome chưa đăng nhập)
---
## Đề bài
Kiểm tra có thể ghép chuỗi `ransomNote` từ các chữ cái của `magazine` hay không, mỗi chữ cái trong `magazine` chỉ dùng được một lần.

## Cơ sở lý thuyết
- **Đếm tần suất (counting)**: so sánh hai đa tập ký tự. `ransomNote` ghép được khi và chỉ khi với mọi ký tự, số lần cần ≤ số lần có.
- Bảng băm ký tự → số lượng; với bảng chữ cái nhỏ cố định có thể dùng mảng 26 ô.

## Hướng xử lý
1. Đếm số lần mỗi ký tự xuất hiện trong `magazine`.
2. Duyệt `ransomNote`, trừ dần; nếu số nào xuống âm thì thiếu → `false`.
3. Duyệt hết → `true`.

## Ý tưởng triển khai
- `cnt[c, default: 0] -= 1` rồi kiểm tra `cnt[c]! < 0` — ký tự không có trong `magazine` sẽ xuống `-1` ngay.
- Dừng sớm ngay khi thiếu, không cần đếm hết.

## Ví dụ chạy từng bước
**Input:** `ransomNote = "aa"`, `magazine = "aab"`
**Output:** `true`

```
Đếm magazine: {a: 2, b: 1}
'a' → a = 1
'a' → a = 0
Hết ransomNote, không số nào âm → true
```

**Input:** `ransomNote = "aa"`, `magazine = "ab"`
**Output:** `false`

```
Đếm magazine: {a: 1, b: 1}
'a' → a = 0
'a' → a = -1 < 0 → false
```

## Ghi nhớ
"Ghép được A từ các phần của B" → đếm tần suất B rồi trừ theo A. Cùng họ với bài 242 (anagram) và 49.
