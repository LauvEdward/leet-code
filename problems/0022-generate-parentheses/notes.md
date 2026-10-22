---
id: 22
title: Generate Parentheses
slug: generate-parentheses
difficulty: Medium
topics: Backtracking, String, Dynamic Programming
date: 2026-10-22
time: O(4ⁿ / √n)
space: O(n) (không tính kết quả)
status: Chưa nộp (LeetCode trong Chrome chưa đăng nhập)
---
## Đề bài
Sinh mọi chuỗi gồm `n` cặp ngoặc tròn hợp lệ.

## Cơ sở lý thuyết
- Một chuỗi ngoặc hợp lệ khi và chỉ khi: tổng số `(` bằng `n`, và ở **mọi tiền tố**, số `)` không vượt số `(`.
- **Quay lui có điều kiện**: chỉ thêm ký tự giữ được tính chất trên, nên mọi nhánh đều dẫn tới một chuỗi hợp lệ — không phải sinh rồi lọc.
   - Thêm `(` khi `open < n`.
   - Thêm `)` khi `close < open`.
- Số kết quả là **số Catalan** `Cₙ = C(2n, n) / (n + 1)`, tăng cỡ `4ⁿ / n^1.5`.

## Hướng xử lý
1. `go(cur, open, close)`: đủ `2n` ký tự → ghi.
2. Nếu `open < n` → thử thêm `(`.
3. Nếu `close < open` → thử thêm `)`.

## Ý tưởng triển khai
- Thử `(` trước `)` nên kết quả ra theo thứ tự từ điển (`(` < `)` trong bảng mã).
- Test cục bộ: với `n = 1…8`, số chuỗi bằng số Catalan, không trùng, mọi chuỗi hợp lệ.

## Ví dụ chạy từng bước
**Input:** `n = 3`
**Output:** `["((()))", "(()())", "(())()", "()(())", "()()()"]`

```
""        → chỉ được thêm "("
"("       → thêm "(" hoặc ")"
"(("      → "(((" → ")))" → ghi "((()))"
          → "(()" → "(()(" → "(()()" → ghi "(()())"
                  → "(())" → "(())(" → ghi "(())()"
"()"      → chỉ được thêm "(" (close = open)
          → "()(" → "()((" → ghi "()(())"
                  → "()()" → ghi "()()()"
```

## Ghi nhớ
Sinh các đối tượng hợp lệ → đưa điều kiện hợp lệ vào **lúc chọn** (cắt nhánh sớm) thay vì sinh hết rồi lọc.
