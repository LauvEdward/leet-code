---
id: 208
title: Implement Trie (Prefix Tree)
slug: implement-trie-prefix-tree
difficulty: Medium
topics: Trie, Design, Hash Table, String
date: 2026-10-22
time: O(L) mỗi thao tác
space: O(tổng số ký tự đã chèn)
status: Chưa nộp (LeetCode trong Chrome chưa đăng nhập)
---
## Đề bài
Cài đặt cây tiền tố (Trie) với `insert(word)`, `search(word)` (có từ này chính xác không) và `startsWith(prefix)` (có từ nào bắt đầu bằng tiền tố này không).

## Cơ sở lý thuyết
- **Trie**: mỗi nút ứng với một tiền tố; cạnh mang một ký tự. Mọi từ có chung tiền tố dùng chung đường đi từ gốc. Thao tác trên một từ dài `L` tốn `O(L)`, không phụ thuộc số từ đã lưu.
- Mỗi nút cần một cờ `end` đánh dấu "có từ kết thúc ở đây": `app` là tiền tố của `apple` nhưng chỉ là một từ khi đã được chèn.
- `search` và `startsWith` dùng chung việc **đi theo chuỗi**; khác nhau duy nhất ở chỗ `search` đòi thêm `end == true`.

## Hướng xử lý
1. `insert`: đi từ gốc theo từng ký tự, tạo nút mới khi chưa có; đánh dấu `end` ở nút cuối.
2. `walk(s)`: đi theo `s`, trả nút cuối hoặc `nil` nếu đứt giữa chừng.
3. `search(w)` = `walk(w)?.end == true`; `startsWith(p)` = `walk(p) != nil`.

## Ý tưởng triển khai
- Nút con lưu trong `[Character: Node]` cho gọn (mảng 26 ô nhanh hơn nhưng dài dòng hơn).
- `Node` là `class` để các nút được chia sẻ theo tham chiếu.
- Với bài thiết kế, LeetCode yêu cầu đúng tên lớp `Trie`.
- Test cục bộ: so với một `Set` các từ trên 200 bộ dữ liệu ngẫu nhiên.

## Ví dụ chạy từng bước
**Input:** `insert("apple")`, `search("apple")`, `search("app")`, `startsWith("app")`, `insert("app")`, `search("app")`
**Output:** `true`, `false`, `true`, `true`

```
insert("apple"): gốc → a → p → p → l → e, đánh dấu end tại "e"
search("apple"): đi hết 5 ký tự, nút cuối end = true      → true
search("app"):   đi tới nút "app", end = false            → false
startsWith("app"): đi được tới nút "app"                  → true
insert("app"):   đường đã có sẵn, chỉ đặt end = true tại nút "app"
search("app"):   end = true                               → true
```

## Ghi nhớ
Bài nhiều chuỗi chung tiền tố (tìm theo tiền tố, gợi ý tự động, tìm nhiều từ trên bảng) → Trie. Phân biệt rõ "nút tồn tại" (tiền tố) và "nút có `end`" (từ).
