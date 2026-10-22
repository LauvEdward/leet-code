---
id: 79
title: Word Search
slug: word-search
difficulty: Medium
topics: Backtracking, Matrix, DFS
date: 2026-10-22
time: O(m · n · 4 · 3^(L-1))
space: O(L)
status: Chưa nộp (LeetCode trong Chrome chưa đăng nhập)
---
## Đề bài
Kiểm tra từ `word` có thể ghép từ các ô kề nhau (4 hướng) trên bảng chữ cái không, mỗi ô dùng tối đa một lần.

## Cơ sở lý thuyết
- **DFS có quay lui** từ mỗi ô: khớp ký tự thứ `k`, đánh dấu ô "đang dùng", thử 4 hướng cho ký tự `k + 1`, rồi bỏ đánh dấu khi quay về để đường khác còn dùng được ô đó.
- Mỗi bước sau bước đầu có tối đa 3 hướng mới (không quay lại ô vừa đi), nên chi phí một lần thử là `O(4 · 3^(L-1))`.
- Cắt nhánh sớm: ký tự không khớp thì dừng ngay.

## Hướng xử lý
1. Với mỗi ô, gọi `go(i, j, 0)`.
2. `go(i, j, k)`: đủ `k == L` → đúng; ra ngoài bảng hoặc ô không khớp `word[k]` → sai.
3. Đánh dấu ô bằng `"#"`, thử 4 hướng với `k + 1`, trả lại ký tự cũ.

## Ý tưởng triển khai
- Làm trên bản sao `var b = board`, đánh dấu tại chỗ thay cho mảng `visited`.
- `||` ngắn mạch: tìm thấy ở một hướng thì không thử các hướng còn lại.
- Phải trả lại ký tự **trước khi** `return` (lưu kết quả vào `ok` rồi mới khôi phục).

## Ví dụ chạy từng bước
**Input:** `board = ["ABCE", "SFCS", "ADEE"]`, `word = "ABCCED"`
**Output:** `true`

```
A B C E
S F C S
A D E E

(0,0) A ✓ → (0,1) B ✓ → (0,2) C ✓ → (1,2) C ✓ → (2,2) E ✓ → (2,1) D ✓ → đủ 6 ký tự → true
```

**Input:** cùng bảng, `word = "ABCB"`
**Output:** `false`

```
(0,0) A → (0,1) B → (0,2) C → cần B: các ô kề của (0,2) là (0,1) [đang dùng, '#'],
(0,3) E, (1,2) C → không ô nào khớp → quay lui
Không ô bắt đầu nào khác cho được → false
```

## Ghi nhớ
Tìm đường trên lưới không lặp ô → DFS + đánh dấu tạm + khôi phục khi quay lui. Tìm nhiều từ cùng lúc thì chuyển sang Trie (bài 212).
