---
id: 117
title: Populating Next Right Pointers in Each Node II
slug: populating-next-right-pointers-in-each-node-ii
difficulty: Medium
topics: Binary Tree General, BFS, Linked List
date: 2026-10-20
time: O(n)
space: O(w) (w = số nút nhiều nhất trên một tầng)
status: Chưa nộp (LeetCode trong Chrome chưa đăng nhập)
---
## Đề bài
Mỗi nút của cây nhị phân (không nhất thiết đầy đủ) có thêm con trỏ `next`. Cho `next` của mỗi nút trỏ tới nút ngay bên phải cùng tầng, hoặc `nil` nếu là nút cuối tầng.

## Cơ sở lý thuyết
- **Duyệt theo tầng (BFS)**: các nút cùng tầng xuất hiện liền nhau theo thứ tự trái sang phải; nối từng nút với nút kế tiếp trong danh sách tầng là xong.
- Cách `O(1)` bộ nhớ (câu hỏi thêm của đề): dùng chính các con trỏ `next` của tầng trên — đã nối xong — để đi ngang qua tầng đó và nối tầng dưới bằng một nút giả. Ở đây dùng mảng theo tầng cho đơn giản.

## Hướng xử lý
1. `cur` = danh sách nút của tầng hiện tại (bắt đầu bằng gốc).
2. Với mỗi nút trong `cur`: `next` = nút kế trong `cur` (hoặc `nil` nếu là nút cuối); thêm các con khác `nil` vào danh sách tầng sau.
3. Chuyển sang tầng sau, lặp tới khi hết.

## Ý tưởng triển khai
- Hai mảng `cur`, `nxt` thay cho một hàng đợi — ranh giới tầng rõ ràng, không cần đếm kích thước tầng.
- Chỉ thêm con khác `nil`, nên cây khuyết nút không làm lệch thứ tự.
- Test cục bộ: đọc lại cây theo các con trỏ `next` (`#` đánh dấu hết tầng) và so với đáp án mẫu.

## Ví dụ chạy từng bước
**Input:** `root = [1, 2, 3, 4, 5, null, 7]`
**Output:** `[1, #, 2, 3, #, 4, 5, 7, #]`

```
        1               1 → nil
       / \
      2   3             2 → 3 → nil
     / \   \
    4   5   7           4 → 5 → 7 → nil

Tầng [1]:       1.next = nil              tầng sau: [2, 3]
Tầng [2, 3]:    2.next = 3, 3.next = nil  tầng sau: [4, 5, 7]
Tầng [4, 5, 7]: 4.next = 5, 5.next = 7, 7.next = nil
```

Nút `5` được nối sang `7` dù hai nút có cha khác nhau và giữa chúng có chỗ khuyết — đây là điểm khó của bản II so với bản I (cây đầy đủ).

**Input:** `root = []` → **Output:** `[]`

## Ghi nhớ
Mọi bài "theo tầng" của cây → BFS với ranh giới tầng rõ ràng. Khi bị yêu cầu `O(1)` bộ nhớ, tận dụng con trỏ `next` của tầng trên như một danh sách liên kết để duyệt.
