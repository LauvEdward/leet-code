---
id: 114
title: Flatten Binary Tree to Linked List
slug: flatten-binary-tree-to-linked-list
difficulty: Medium
topics: Binary Tree General, Linked List, Stack, DFS
date: 2026-10-20
time: O(n)
space: O(1)
status: Chưa nộp (LeetCode trong Chrome chưa đăng nhập)
---
## Đề bài
"Duỗi" cây nhị phân thành một danh sách liên kết tại chỗ: dùng con trỏ `right` làm `next`, mọi `left` bằng `nil`, và thứ tự các nút đúng bằng thứ tự duyệt tiền thứ tự.

## Cơ sở lý thuyết
- Trong tiền thứ tự (gốc, trái, phải), toàn bộ cây con phải của một nút đứng **ngay sau nút cuối cùng của cây con trái** — tức nút **phải nhất** của cây con trái.
- **Ý tưởng kiểu Morris**: tại mỗi nút có con trái, gắn cây con phải vào sau nút phải nhất của cây con trái, rồi chuyển cả cây con trái sang bên phải. Sau đó đi tiếp sang phải. Không cần ngăn xếp hay đệ quy → `O(1)` bộ nhớ.
- Tổng số bước đi tìm nút phải nhất vẫn là `O(n)` vì mỗi cạnh "phải" chỉ bị đi qua một số lần bị chặn.

## Hướng xử lý
1. `cur = root`.
2. Nếu `cur` có con trái `l`:
   - Tìm nút phải nhất `r` của cây con trái.
   - `r.right = cur.right`; `cur.right = l`; `cur.left = nil`.
3. `cur = cur.right`, lặp tới khi hết.

## Ý tưởng triển khai
- `while let x = r.right { r = x }` tìm nút phải nhất.
- Hàm không trả về gì (cây được sửa tại chỗ).
- Test cục bộ: so dãy thu được khi đi theo `right` với dãy tiền thứ tự của cây gốc, và kiểm tra mọi `left` đều `nil`.

## Ví dụ chạy từng bước
**Input:** `root = [1, 2, 5, 3, 4, null, 6]`
**Output:** `[1, null, 2, null, 3, null, 4, null, 5, null, 6]`

```
        1
       / \
      2   5
     / \   \
    3   4   6

cur = 1: có con trái 2; nút phải nhất của nhánh trái là 4
         4.right = 5;  1.right = 2;  1.left = nil
         → 1 → 2 (2 vẫn có trái 3, phải 4 → 5 → 6)
cur = 2: có con trái 3; nút phải nhất của nhánh trái là 3
         3.right = 4;  2.right = 3;  2.left = nil
         → 1 → 2 → 3 → 4 → 5 → 6
cur = 3, 4, 5, 6: không còn con trái, chỉ đi tiếp sang phải
```

**Input:** `root = [0]` → **Output:** `[0]`

## Ghi nhớ
"Nối cây con phải vào sau nút phải nhất của cây con trái" là mẹo Morris — dùng cho cả duyệt trung thứ tự `O(1)` bộ nhớ. Cách đệ quy dễ nghĩ hơn: làm phẳng hai cây con rồi nối, hoặc duyệt theo thứ tự phải → trái → gốc với con trỏ `prev`.
