---
id: 28
title: Find the Index of the First Occurrence in a String
slug: find-the-index-of-the-first-occurrence-in-a-string
difficulty: Easy
topics: Array / String, Two Pointers, String Matching
date: 2026-10-13
time: O(n · m)
space: O(n + m)
status: Accepted
---
## Đề bài
Trả về vị trí đầu tiên mà `needle` xuất hiện trong `haystack`, hoặc `-1` nếu không có.

## Cơ sở lý thuyết
- **So khớp chuỗi ngây thơ**: thử từng vị trí bắt đầu `i`, so `needle` với đoạn `haystack[i ..< i + m]`. Tệ nhất `O(n · m)`.
- Các thuật toán tuyến tính: **KMP** (bảng tiền tố để không lùi con trỏ), **Rabin–Karp** (băm cuộn), **Z-algorithm**. Với `n, m ≤ 10⁴` cách ngây thơ đã đủ.
- Trong Swift, so sánh `Character` chậm vì phải xử lý Unicode; so trên mảng byte `utf8` nhanh hơn nhiều và đúng với dữ liệu ASCII của đề.

## Hướng xử lý
1. Nếu `needle` dài hơn `haystack` → `-1`.
2. Với mỗi `i` từ `0` đến `n - m`: nếu đoạn dài `m` bắt đầu tại `i` bằng `needle` thì trả `i`.
3. Không tìm thấy → `-1`.

## Ý tưởng triển khai
- `Array(haystack.utf8)` và `Array(needle.utf8)` để có chỉ số nguyên.
- `h[i..<i + n.count].elementsEqual(n)` so từng phần tử và **dừng ngay** khi gặp chỗ khác nhau.
- Phải kiểm tra độ dài trước: nếu không, khoảng `0...(h.count - n.count)` có cận trên âm và Swift sẽ crash.
- Test cục bộ đối chiếu với `String.range(of:)` trên 3000 cặp chuỗi ngẫu nhiên.

## Ví dụ chạy từng bước
**Input:** `haystack = "sadbutsad"`, `needle = "sad"`
**Output:** `0`

```
n = 9, m = 3 → thử i từ 0 đến 6
i=0: "sad" == "sad" ✓ → trả về 0
```

**Input:** `haystack = "leetcode"`, `needle = "leeto"`
**Output:** `-1`

```
n = 8, m = 5 → thử i từ 0 đến 3
i=0: "leetc" vs "leeto" → khác ở ký tự thứ 5 ✗
i=1: "eetco" ✗ (khác ngay ký tự đầu)
i=2: "etcod" ✗
i=3: "tcode" ✗
Hết → -1
```

**Input:** `haystack = "a"`, `needle = "ab"` → **Output:** `-1` (`needle` dài hơn, trả về ngay).

## Ghi nhớ
Bài tìm chuỗi con: cách ngây thơ trước, nhưng biết tên và ý tưởng của KMP để trả lời câu hỏi "làm sao nhanh hơn". Ở Swift, đổi sang `utf8` trước khi lặp nhiều trên chuỗi.
