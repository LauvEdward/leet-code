---
id: 230
title: Kth Smallest Element in a BST
slug: kth-smallest-element-in-a-bst
difficulty: Medium
topics: Binary Search Tree, Stack, DFS
date: 2026-10-21
time: O(h + k)
space: O(h)
status: Chưa nộp (LeetCode trong Chrome chưa đăng nhập)
---
## Đề bài
Tìm giá trị nhỏ thứ `k` (đếm từ 1) trong cây nhị phân tìm kiếm.

## Cơ sở lý thuyết
- Duyệt trung thứ tự BST cho dãy tăng → phần tử thứ `k` gặp được chính là đáp án.
- **Duyệt trung thứ tự bằng ngăn xếp** (như bài 173) cho phép **dừng ngay** khi đếm đủ `k`, không cần duyệt cả cây: chi phí `O(h + k)`.
- Câu hỏi thêm của đề (cây bị sửa thường xuyên, hỏi nhiều lần): lưu kích thước cây con ở mỗi nút để rẽ trái/phải trong `O(h)`.

## Hướng xử lý
1. Đẩy đường đi bên trái từ `cur` vào ngăn xếp.
2. Lấy đỉnh `x` ra — đây là phần tử nhỏ nhất chưa xét; giảm `k`. Nếu `k == 0` → trả `x.val`.
3. Chuyển sang `cur = x.right`, lặp lại.

## Ý tưởng triển khai
- `var k = k` để đếm ngược trên bản sao của tham số.
- `while true` chắc chắn kết thúc vì đề đảm bảo `1 ≤ k ≤ số nút`.
- Test cục bộ: mọi `k` trên 1000 BST ngẫu nhiên.

## Ví dụ chạy từng bước
**Input:** `root = [5, 3, 6, 2, 4, null, null, 1]`, `k = 3`
**Output:** `3`

```
          5
         / \
        3   6
       / \
      2   4
     /
    1

Đẩy trái từ 5: st = [5, 3, 2, 1]
Lấy 1 → k = 2; cur = 1.right = nil
Lấy 2 → k = 1; cur = nil
Lấy 3 → k = 0 → trả 3
```

**Input:** `root = [3, 1, 4, null, 2]`, `k = 1` → **Output:** `1` (lấy ngay phần tử đầu tiên).

## Ghi nhớ
Cần phần tử thứ `k` theo thứ tự → duyệt trung thứ tự lặp và dừng sớm. Ngăn xếp giúp kiểm soát việc dừng, điều mà đệ quy làm kém tự nhiên hơn.
