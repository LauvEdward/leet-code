---
id: 150
title: Evaluate Reverse Polish Notation
slug: evaluate-reverse-polish-notation
difficulty: Medium
topics: Stack, Array, Math
date: 2026-10-19
time: O(n)
space: O(n)
status: Chưa nộp (LeetCode trong Chrome chưa đăng nhập)
---
## Đề bài
Tính giá trị biểu thức viết theo **ký pháp Ba Lan ngược** (toán tử đứng sau hai toán hạng), với `+ - * /`. Phép chia số nguyên làm tròn về 0.

## Cơ sở lý thuyết
- **Ký pháp hậu tố (postfix)**: `3 4 +` nghĩa là `3 + 4`. Không cần dấu ngoặc và không cần quy tắc ưu tiên — thứ tự tính đã nằm sẵn trong thứ tự token.
- **Ngăn xếp toán hạng**: số thì đẩy vào; toán tử thì lấy hai số trên đỉnh, tính, đẩy kết quả lại. Kết thúc, ngăn xếp còn đúng một số là đáp án.
- **Thứ tự toán hạng**: số lấy ra **đầu tiên** là toán hạng **phải**. Quan trọng với `-` và `/`.
- Phép `/` của Swift trên `Int` làm tròn về 0 (`-7 / 2 == -3`), đúng yêu cầu đề.

## Hướng xử lý
1. Duyệt token: nếu đổi được thành số thì đẩy vào ngăn xếp.
2. Ngược lại lấy `b` (đỉnh) rồi `a`, tính `a op b`, đẩy kết quả.
3. Trả về phần tử duy nhất còn lại.

## Ý tưởng triển khai
- `Int(t)` trả `nil` với `"+"`, `"-"`… và đổi được số âm như `"-11"` — nên không nhầm dấu trừ với số âm.
- `let b = st.removeLast(), a = st.removeLast()` — Swift đánh giá từ trái sang phải nên `b` là đỉnh.
- `switch` với `default` cho phép chia.

## Ví dụ chạy từng bước
**Input:** `tokens = ["4", "13", "5", "/", "+"]`
**Output:** `6`

```
"4"  → st = [4]
"13" → st = [4, 13]
"5"  → st = [4, 13, 5]
"/"  → b = 5, a = 13 → 13 / 5 = 2   → st = [4, 2]
"+"  → b = 2, a = 4  → 4 + 2 = 6    → st = [6]
Trả về 6
```

**Input:** `tokens = ["-7", "2", "/"]` → **Output:** `-3`

```
"-7" là số (Int("-7") = -7) → st = [-7]
"2" → st = [-7, 2]
"/" → -7 / 2 = -3 (làm tròn về 0, không phải -4)
```

## Ghi nhớ
Ký pháp hậu tố → một ngăn xếp số. Cẩn thận thứ tự hai toán hạng khi lấy ra. Bài 224 tính biểu thức trung tố có ngoặc — khó hơn vì phải tự xử lý thứ tự.
