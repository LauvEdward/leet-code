---
id: 19
title: Remove Nth Node From End of List
slug: remove-nth-node-from-end-of-list
difficulty: Medium
topics: Linked List, Two Pointers
date: 2026-10-19
time: O(n)
space: O(1)
status: Chưa nộp (LeetCode trong Chrome chưa đăng nhập)
---
## Đề bài
Xóa nút thứ `n` **tính từ cuối** của danh sách liên kết, làm trong một lượt duyệt.

## Cơ sở lý thuyết
- **Hai con trỏ giữ khoảng cách cố định**: cho `fast` đi trước `n + 1` bước rồi cho hai con trỏ cùng đi. Khi `fast` ra khỏi danh sách (`nil`), `slow` đứng đúng **ngay trước** nút cần xóa.
- Lý do cần `n + 1` thay vì `n`: muốn xóa một nút trong danh sách liên kết đơn, phải đứng ở nút **trước** nó.
- **Nút giả** để xử lý trường hợp xóa chính nút đầu (khi `n` bằng độ dài danh sách).

## Hướng xử lý
1. `dummy → head`; `fast = slow = dummy`.
2. `fast` đi `n + 1` bước.
3. Cùng đi tới khi `fast == nil`.
4. `slow.next = slow.next.next`.

## Ý tưởng triển khai
- `for _ in 0...n` chạy đúng `n + 1` lần.
- `fast` là optional vì có thể thành `nil`; `slow` luôn là nút thật nên force-unwrap được.
- Test cục bộ: mọi độ dài 1…10 với mọi `n` hợp lệ.

## Ví dụ chạy từng bước
**Input:** `head = [1, 2, 3, 4, 5]`, `n = 2`
**Output:** `[1, 2, 3, 5]`

```
Ban đầu: fast = slow = dummy
fast đi 3 bước: dummy → 1 → 2 → 3          fast = 3
Cùng đi:  fast = 4,   slow = 1
          fast = 5,   slow = 2
          fast = nil, slow = 3 → dừng
slow = 3 đứng trước nút 4 (thứ 2 từ cuối) → 3.next = 5
Kết quả: 1 → 2 → 3 → 5
```

**Input:** `head = [1]`, `n = 1` → **Output:** `[]`

```
fast đi 2 bước: dummy → 1 → nil
Không vào vòng lặp, slow = dummy → dummy.next = nil → danh sách rỗng
```

## Ghi nhớ
"Phần tử thứ `n` từ cuối" trong một lượt → hai con trỏ cách nhau cố định. Cần đứng trước nút để xóa → cách nhau `n + 1` và bắt đầu từ dummy.
