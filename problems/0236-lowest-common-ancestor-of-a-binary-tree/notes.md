---
id: 236
title: Lowest Common Ancestor of a Binary Tree
slug: lowest-common-ancestor-of-a-binary-tree
difficulty: Medium
topics: Binary Tree General, DFS
date: 2026-10-21
time: O(n)
space: O(h)
status: Chưa nộp (LeetCode trong Chrome chưa đăng nhập)
---
## Đề bài
Tìm **tổ tiên chung thấp nhất** (LCA) của hai nút `p`, `q` trong cây nhị phân — nút sâu nhất có cả `p` và `q` trong cây con của nó (một nút được coi là tổ tiên của chính nó).

## Cơ sở lý thuyết
- **Đệ quy trả về "tìm thấy gì trong cây con"**: hàm trả về `p` hoặc `q` nếu gặp một trong hai, trả về LCA nếu cả hai nằm trong cây con, và `nil` nếu không có gì.
- Tại nút `root`:
   - Nếu `root` chính là `p` hoặc `q` → trả `root` luôn: nếu nút kia nằm dưới nó thì `root` là LCA; nếu nằm chỗ khác thì tầng trên sẽ tự xử lý.
   - Nếu cây con trái và phải **mỗi bên** trả về một thứ khác `nil` → `p` và `q` nằm ở hai phía → `root` là LCA.
   - Ngược lại trả về bên khác `nil` (đẩy kết quả lên).
- So sánh bằng **danh tính** nút (`===`), đề đảm bảo `p`, `q` có trong cây.

## Hướng xử lý
1. `root` rỗng hoặc là `p` hoặc `q` → trả `root`.
2. `l = LCA(trái)`, `r = LCA(phải)`.
3. Cả hai khác `nil` → `root`; còn lại → `l ?? r`.

## Ý tưởng triển khai
- `root?.left` để gọi đệ quy được cả khi `root` là optional.
- Test cục bộ: so với cách tìm đường từ gốc tới `p`, tới `q` rồi lấy nút chung cuối cùng, trên 1000 cặp nút ngẫu nhiên.

## Ví dụ chạy từng bước
**Input:** `root = [3, 5, 1, 6, 2, 0, 8, null, null, 7, 4]`, `p = 5`, `q = 1`
**Output:** `3`

```
          3
        /   \
       5     1
      / \   / \
     6   2 0   8
        / \
       7   4

lca(3): 3 không phải p, q
   lca(5): là p → trả 5
   lca(1): là q → trả 1
   cả hai khác nil → trả 3
```

**Input:** cùng cây, `p = 5`, `q = 4`
**Output:** `5`

```
lca(3):
   lca(5): là p → trả 5 ngay (không cần tìm 4 bên dưới)
   lca(1): cây con 1, 0, 8 không có p hay q → nil
   → trả 5   (4 nằm dưới 5 nên 5 là LCA)
```

## Ghi nhớ
LCA trên cây nhị phân thường: hậu thứ tự, "hai bên đều thấy → mình là đáp án, một bên thấy → đẩy lên". Với BST (bài 235) chỉ cần so giá trị để biết rẽ trái hay phải.
