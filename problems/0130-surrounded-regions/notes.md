---
id: 130
title: Surrounded Regions
slug: surrounded-regions
difficulty: Medium
topics: Graph General, DFS, BFS, Matrix
date: 2026-10-21
time: O(m · n)
space: O(m · n)
status: Chưa nộp (LeetCode trong Chrome chưa đăng nhập)
---
## Đề bài
Bảng gồm `"X"` và `"O"`. Một vùng `"O"` (nối theo 4 hướng) bị **bao vây** nếu không có ô nào của nó nằm trên mép bảng. Đổi mọi vùng bị bao vây thành `"X"`, tại chỗ.

## Cơ sở lý thuyết
- **Suy nghĩ ngược**: thay vì kiểm tra từng vùng có bị bao vây không, tìm những ô **không** bị bao vây — đó là mọi ô `"O"` nối được tới một ô `"O"` trên mép bảng.
- **Loang nhiều nguồn**: bắt đầu từ tất cả ô `"O"` trên mép cùng lúc, loang vào trong và đánh dấu tạm. Ô `"O"` nào không được đánh dấu chắc chắn bị bao vây.
- Mỗi ô được loang tối đa một lần → `O(m · n)`.

## Hướng xử lý
1. Đánh dấu `"#"` mọi ô `"O"` trên mép và đẩy vào ngăn xếp.
2. Loang: hàng xóm nào là `"O"` thì đánh `"#"` và đẩy vào.
3. Duyệt cả bảng: `"O"` còn lại → `"X"`; `"#"` → trả về `"O"`.

## Ý tưởng triển khai
- Dùng ký tự tạm `"#"` để phân biệt "an toàn" với "chưa xét" mà không cần mảng phụ.
- Ngăn xếp tường minh thay cho đệ quy để không tràn ngăn xếp với bảng `200 × 200` toàn `"O"` (test cục bộ có ca này).
- Test cục bộ: với từng ô `"O"`, BFS xem có chạm mép không, so trên 2000 bảng ngẫu nhiên.

## Ví dụ chạy từng bước
**Input:** `board = ["XXXX", "XOOX", "XXOX", "XOXX"]`
**Output:** `["XXXX", "XXXX", "XXXX", "XOXX"]`

```
X X X X
X O O X
X X O X
X O X X

Bước 1 — ô O trên mép: chỉ (3,1) → đánh "#"
Bước 2 — loang từ (3,1): hàng xóm (2,1) là X → không loang thêm
Bước 3 — duyệt bảng:
   (1,1), (1,2), (2,2) vẫn là O → bị bao vây → X
   (3,1) là # → trả về O
```

**Input:** `board = ["X"]` → **Output:** `["X"]`

## Ghi nhớ
Khi điều kiện "bị bao vây / không thoát được" khó kiểm tra trực tiếp, đi ngược từ biên: loang từ những chỗ chắc chắn "thoát được". Cùng ý tưởng với bài 417 (Pacific Atlantic) và 1020.
