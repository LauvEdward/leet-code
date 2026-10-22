---
id: 212
title: Word Search II
slug: word-search-ii
difficulty: Hard
topics: Trie, Backtracking, Matrix
date: 2026-10-22
time: O(m · n · 4 · 3^(L-1)) tệ nhất
space: O(tổng số ký tự của các từ)
status: Chưa nộp (LeetCode trong Chrome chưa đăng nhập)
---
## Đề bài
Cho bảng chữ cái `m × n` và danh sách từ. Tìm mọi từ có thể ghép bằng một đường đi qua các ô kề nhau (4 hướng), mỗi ô dùng tối đa một lần trong một từ.

## Cơ sở lý thuyết
- Cách ngây thơ: chạy bài 79 cho từng từ → lặp lại việc duyệt bảng cho mỗi từ.
- **Trie của danh sách từ + một lần DFS từ mỗi ô**: khi đi trên bảng, đồng thời đi trên Trie. Nếu tiền tố hiện tại không có trong Trie thì **cắt nhánh** ngay — vì không từ nào bắt đầu như vậy. Một lần duyệt tìm được mọi từ cùng lúc.
- **Tối ưu bằng cách cắt Trie**: sau khi tìm được từ, xóa nó khỏi nút (tránh trùng) và nếu nút không còn con nào thì gỡ luôn khỏi cha — các lần DFS sau không phải đi lại nhánh đã cạn.

## Hướng xử lý
1. Dựng Trie; nút kết thúc lưu luôn chuỗi từ (`word`).
2. Với mỗi ô, gọi `dfs(i, j, root)`:
   - Ký tự ô không có trong con của nút cha → dừng.
   - Nút có `word` → ghi vào kết quả, đặt `word = nil`.
   - Đánh dấu ô `"#"`, đi 4 hướng, rồi trả lại ký tự (quay lui).
   - Nút hết con và hết từ → gỡ khỏi cha.

## Ý tưởng triển khai
- Lưu cả chuỗi ở nút cuối nên không cần ghép chuỗi trong lúc DFS.
- Đánh dấu tại chỗ bằng `"#"` thay cho mảng `visited`.
- Độ sâu đệ quy chỉ bằng độ dài từ (tối đa 10) nên dùng đệ quy thoải mái.
- Test cục bộ: so với việc kiểm tra từng từ bằng DFS độc lập (bài 79) trên 300 bảng ngẫu nhiên, và kiểm tra không có từ trùng.

## Ví dụ chạy từng bước
**Input:** `board = ["oaan", "etae", "ihkr", "iflv"]`, `words = ["oath", "pea", "eat", "rain"]`
**Output:** `["oath", "eat"]` (thứ tự tùy ý)

```
o a a n
e t a e
i h k r
i f l v

Trie gốc có con: o, p, e, r
(0,0) 'o' → trie o → (0,1) 'a' → oa → (1,1) 't' → oat → (2,1) 'h' → oath ✓ ghi "oath"
(1,3) 'e' → trie e → (1,2) 'a' → ea → (1,1) 't' → eat ✓ ghi "eat"
(2,3) 'r' → trie r → hàng xóm e, v, k: không có 'a' → cắt nhánh
Không ô nào là 'p' → "pea" không bao giờ được thử tiếp quá gốc
```

**Input:** `board = ["a"]`, `words = ["a", "a"]` → **Output:** `["a"]` (đặt `word = nil` sau lần đầu nên không ghi trùng).

## Ghi nhớ
Tìm **nhiều** mẫu cùng lúc trên một không gian tìm kiếm → gom các mẫu vào Trie và duyệt một lần, cắt nhánh khi tiền tố không còn trong Trie.
