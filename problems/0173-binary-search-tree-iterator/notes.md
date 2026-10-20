---
id: 173
title: Binary Search Tree Iterator
slug: binary-search-tree-iterator
difficulty: Medium
topics: Binary Tree General, Stack, Design, Binary Search Tree
date: 2026-10-20
time: O(1) khấu hao mỗi lần next
space: O(h)
status: Chưa nộp (LeetCode trong Chrome chưa đăng nhập)
---
## Đề bài
Cài đặt bộ duyệt cho cây nhị phân tìm kiếm (BST): `next()` trả về số nhỏ nhất kế tiếp, `hasNext()` cho biết còn số nào không. Yêu cầu `O(1)` trung bình mỗi thao tác và chỉ dùng `O(h)` bộ nhớ.

## Cơ sở lý thuyết
- Duyệt **trung thứ tự** BST cho các giá trị theo thứ tự tăng.
- **Duyệt trung thứ tự bằng ngăn xếp, tạm dừng được**: ngăn xếp chứa "đường đi bên trái" chưa xử lý. Đỉnh luôn là nút nhỏ nhất chưa trả về. Khi lấy một nút ra, phần tử kế tiếp nằm trong cây con phải của nó → đẩy đường đi bên trái của cây con phải vào.
- **Khấu hao**: mỗi nút được đẩy vào và lấy ra đúng một lần, nên `n` lần `next()` tốn tổng `O(n)` → trung bình `O(1)`. Ngăn xếp không bao giờ sâu hơn chiều cao cây `h`.

## Hướng xử lý
1. Khởi tạo: đẩy gốc và mọi con trái liên tiếp vào ngăn xếp.
2. `next()`: lấy đỉnh `x`; đẩy đường đi bên trái của `x.right`; trả `x.val`.
3. `hasNext()`: ngăn xếp khác rỗng.

## Ý tưởng triển khai
- Hàm phụ `pushLeft(node)` dùng chung cho khởi tạo và `next()`.
- Không duyệt trước toàn bộ cây vào mảng (sẽ tốn `O(n)` bộ nhớ, vi phạm yêu cầu).
- Với bài thiết kế, LeetCode yêu cầu đúng tên lớp `BSTIterator`.
- Test cục bộ: 1000 BST ngẫu nhiên, gọi `next()` tới hết và so với dãy giá trị đã sắp.

## Ví dụ chạy từng bước
**Input:** `BSTIterator([7, 3, 15, null, null, 9, 20])`, rồi lần lượt `next`, `next`, `hasNext`, `next`, `hasNext`, `next`, `hasNext`, `next`, `hasNext`
**Output:** `3`, `7`, `true`, `9`, `true`, `15`, `true`, `20`, `false`

```
      7
     / \
    3   15
       /  \
      9    20

Khởi tạo: pushLeft(7) → st = [7, 3]
next():   lấy 3, pushLeft(nil)        st = [7]       trả 3
next():   lấy 7, pushLeft(15) → 15, 9 st = [15, 9]   trả 7
hasNext(): st khác rỗng → true
next():   lấy 9                        st = [15]      trả 9
hasNext(): true
next():   lấy 15, pushLeft(20)         st = [20]      trả 15
hasNext(): true
next():   lấy 20                       st = []        trả 20
hasNext(): false
```

## Ghi nhớ
Bộ duyệt "lười" cho cây → biến đệ quy thành ngăn xếp tường minh để có thể tạm dừng giữa chừng. Phân tích khấu hao giải thích vì sao `next()` vẫn là `O(1)` dù có vòng lặp bên trong.
