---
id: 211
title: Design Add and Search Words Data Structure
slug: design-add-and-search-words-data-structure
difficulty: Medium
topics: Trie, Design, DFS, String
date: 2026-10-22
time: addWord O(L); search O(L) không có '.', tệ nhất O(26^L)
space: O(tổng số ký tự)
status: Chưa nộp (LeetCode trong Chrome chưa đăng nhập)
---
## Đề bài
Thiết kế cấu trúc `addWord(word)` và `search(word)`, trong đó `word` khi tìm có thể chứa `.` khớp với **một ký tự bất kỳ**.

## Cơ sở lý thuyết
- Lưu từ trong **Trie** như bài 208.
- Ký tự thường: đi theo đúng một nhánh. Ký tự `.`: phải **thử mọi nhánh con** → tìm kiếm trở thành **DFS có quay lui** trên Trie.
- Đề giới hạn tối đa 2 dấu `.` mỗi truy vấn, nên số nhánh phải thử luôn nhỏ trong thực tế.

## Hướng xử lý
1. `addWord`: chèn như bài 208.
2. `dfs(w, i, node)`:
   - `i == w.count` → trả `node.end`.
   - `w[i] == "."` → thử từng con `k`: nếu `dfs(w, i + 1, k)` đúng thì trả `true`; hết → `false`.
   - Ký tự thường → không có nhánh → `false`; có → đi tiếp nhánh đó.

## Ý tưởng triển khai
- Đổi chuỗi sang `[Character]` một lần để đánh chỉ số.
- `for (_, k) in n.kids where dfs(w, i + 1, k) { return true }` — dừng ngay khi tìm được một nhánh khớp.
- Với bài thiết kế, LeetCode yêu cầu đúng tên lớp `WordDictionary`.
- Test cục bộ: so với việc khớp mẫu từng từ đã thêm trên 200 bộ dữ liệu ngẫu nhiên.

## Ví dụ chạy từng bước
**Input:** `addWord("bad")`, `addWord("dad")`, `addWord("mad")`, `search("pad")`, `search("bad")`, `search(".ad")`, `search("b..")`
**Output:** `false`, `true`, `true`, `true`

```
Trie: gốc → b → a → d(end)
          → d → a → d(end)
          → m → a → d(end)

search("pad"): gốc không có nhánh 'p'                           → false
search("bad"): b → a → d, end = true                            → true
search(".ad"): '.' → thử nhánh b: a → d, end = true             → true (dừng, không thử d, m)
search("b.."): b → '.' thử nhánh a → '.' thử nhánh d → end = true → true
```

**Input:** `search("b...")` → **Output:** `false` (đi hết `bad` vẫn còn một `.` nhưng nút `d` không có con).

## Ghi nhớ
Ký tự đại diện trên Trie → DFS thử mọi con tại vị trí đại diện, đi một nhánh ở vị trí thường.
