---
id: 399
title: Evaluate Division
slug: evaluate-division
difficulty: Medium
topics: Graph General, DFS, BFS, Union Find, Shortest Path
date: 2026-10-21
time: O(Q · (V + E))
space: O(V + E)
status: Chưa nộp (LeetCode trong Chrome chưa đăng nhập)
---
## Đề bài
Cho các phương trình `A / B = k` (biến là chuỗi). Trả lời các truy vấn `C / D`; nếu không suy ra được (hoặc có biến chưa từng xuất hiện) thì trả `-1.0`.

## Cơ sở lý thuyết
- **Mô hình đồ thị có trọng số**: mỗi biến là một đỉnh; phương trình `A / B = k` cho cạnh `A → B` trọng số `k` và cạnh `B → A` trọng số `1 / k`.
- Theo quy tắc nhân phân số, `A / C = (A / B) × (B / C)` — tức **tích trọng số dọc đường đi** từ `A` tới `C`. Đề đảm bảo dữ liệu không mâu thuẫn, nên mọi đường đi giữa hai đỉnh cho cùng một giá trị; chỉ cần tìm **một** đường bất kỳ.
- Hai biến không cùng thành phần liên thông → không suy ra được.
- Cách nhanh hơn khi có nhiều truy vấn: Union-Find có trọng số (lưu tỉ lệ tới gốc).

## Hướng xử lý
1. Dựng danh sách kề từ các phương trình.
2. Với mỗi truy vấn `(a, b)`: nếu `a` hoặc `b` chưa có trong đồ thị → `-1`.
3. Ngược lại DFS từ `a` tìm `b`, nhân dồn trọng số; không tới được → `-1`.

## Ý tưởng triển khai
- `g[a, default: []]` để đỉnh không có cạnh ra trả về mảng rỗng.
- DFS trả `Double?` — `nil` nghĩa là không tìm thấy đường từ nhánh đó.
- Tập `seen` truyền `inout` để đánh dấu đỉnh đã thăm trong một lần truy vấn.
- `a / a` với `a` có trong đồ thị trả `1.0` ngay ở ca cơ sở; với biến lạ (`x / x`) trả `-1.0` vì bị chặn ở bước 2.
- Test cục bộ: gán giá trị ngẫu nhiên cho các biến, sinh phương trình từ đó rồi hỏi mọi cặp.

## Ví dụ chạy từng bước
**Input:** `equations = [["a", "b"], ["b", "c"]]`, `values = [2.0, 3.0]`, `queries = [["a", "c"], ["b", "a"], ["a", "e"], ["a", "a"], ["x", "x"]]`
**Output:** `[6.0, 0.5, -1.0, 1.0, -1.0]`

```
Đồ thị: a → b (2), b → a (0.5), b → c (3), c → b (1/3)

a / c: dfs(a): sang b (×2) → dfs(b): a đã thăm; sang c (×3) → dfs(c) = c → 1
       → 3 × 1 = 3 → 2 × 3 = 6.0
b / a: dfs(b): sang a (×0.5) → a == a → 0.5
a / e: e chưa xuất hiện → -1.0
a / a: dfs(a) gặp ngay a == a → 1.0
x / x: x chưa xuất hiện → -1.0
```

## Ghi nhớ
Quan hệ dạng tỉ lệ / tích dọc đường đi → đồ thị có trọng số, đường đi nhân dồn. Gặp quan hệ "bắc cầu" giữa các biến, hãy nghĩ tới đồ thị hoặc Union-Find.
