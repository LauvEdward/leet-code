---
id: 17
title: Letter Combinations of a Phone Number
slug: letter-combinations-of-a-phone-number
difficulty: Medium
topics: Backtracking, Hash Table, String
date: 2026-10-22
time: O(4ⁿ · n)
space: O(n) (không tính kết quả)
status: Chưa nộp (LeetCode trong Chrome chưa đăng nhập)
---
## Đề bài
Cho chuỗi chữ số `2–9`, trả về mọi chuỗi chữ cái có thể gõ được theo bàn phím điện thoại (2 → abc, 3 → def, …, 7 → pqrs, 9 → wxyz).

## Cơ sở lý thuyết
- Đây là **tích Descartes** của các tập chữ cái ứng với từng chữ số: chọn một chữ cho chữ số thứ nhất, một chữ cho chữ số thứ hai…
- **Quay lui (backtracking)**: dựng dần chuỗi theo từng vị trí; ở mỗi vị trí thử lần lượt mọi lựa chọn, đi sâu xuống vị trí sau, khi đủ độ dài thì ghi kết quả.
- Số kết quả tối đa `4ⁿ` (với `n ≤ 4`), nên độ phức tạp bị chặn bởi kích thước đầu ra.

## Hướng xử lý
1. Chuỗi rỗng → mảng rỗng (không phải `[""]`).
2. `go(i, cur)`: nếu `i == n` thì ghi `cur`; ngược lại với mỗi chữ cái của chữ số thứ `i`, gọi `go(i + 1, cur + chữ)`.

## Ý tưởng triển khai
- Truyền `cur` theo giá trị (`cur + String(c)`) nên không cần bước "gỡ ra" khi quay lui — chuỗi ngắn nên chi phí sao chép không đáng kể.
- Bảng ánh xạ `[Character: String]`.

## Ví dụ chạy từng bước
**Input:** `digits = "23"`
**Output:** `["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"]`

```
go(0, "")
├── 'a' → go(1, "a") → 'd', 'e', 'f' → ghi "ad", "ae", "af"
├── 'b' → go(1, "b") → ghi "bd", "be", "bf"
└── 'c' → go(1, "c") → ghi "cd", "ce", "cf"
```

**Input:** `digits = ""` → **Output:** `[]`

## Ghi nhớ
Liệt kê mọi tổ hợp "mỗi vị trí chọn một trong vài lựa chọn" → quay lui theo vị trí. Nhớ ca đầu vào rỗng.
