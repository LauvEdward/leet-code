---
id: 21
title: Merge Two Sorted Lists
slug: merge-two-sorted-lists
difficulty: Easy
topics: Linked List, Recursion
date: 2026-10-19
time: O(m + n)
space: O(1)
status: Chưa nộp (LeetCode trong Chrome chưa đăng nhập)
---
## Đề bài
Trộn hai danh sách liên kết đã sắp tăng thành một danh sách sắp tăng, bằng cách nối lại chính các nút có sẵn.

## Cơ sở lý thuyết
- **Trộn hai dãy đã sắp (merge)**: luôn lấy phần tử nhỏ hơn trong hai đầu dãy; bước lõi của merge sort.
- Với danh sách liên kết, không cần chép dữ liệu: chỉ **nối lại con trỏ `next`** → bộ nhớ phụ `O(1)`.
- **Nút giả (dummy head)** để không phải xử lý riêng việc chọn nút đầu tiên.

## Hướng xử lý
1. `dummy` và con trỏ đuôi `t`.
2. Khi cả hai danh sách còn nút: gắn nút nhỏ hơn vào sau `t`, tiến con trỏ của danh sách đó, tiến `t`.
3. Gắn nguyên phần còn lại của danh sách chưa hết vào sau `t`.

## Ý tưởng triển khai
- `while let x = a, let y = b` — vòng lặp chỉ chạy khi cả hai khác `nil`, đồng thời mở optional luôn.
- `t.next = a ?? b` — phần còn lại đã sắp sẵn, gắn một lần là xong.
- So sánh `<=` để khi bằng nhau ưu tiên danh sách thứ nhất (ổn định).

## Ví dụ chạy từng bước
**Input:** `list1 = [1, 2, 4]`, `list2 = [1, 3, 4]`
**Output:** `[1, 1, 2, 3, 4, 4]`

```
a=1, b=1: 1 <= 1 → lấy a(1)   kết quả: 1           a=2
a=2, b=1: 2 <= 1 sai → lấy b(1) kết quả: 1,1       b=3
a=2, b=3: lấy a(2)            kết quả: 1,1,2       a=4
a=4, b=3: lấy b(3)            kết quả: 1,1,2,3     b=4
a=4, b=4: lấy a(4)            kết quả: 1,1,2,3,4   a=nil
a hết → gắn phần còn lại của b: 4
Kết quả: 1 → 1 → 2 → 3 → 4 → 4
```

**Input:** `list1 = []`, `list2 = [0]` → **Output:** `[0]` (vòng lặp không chạy, gắn thẳng `list2`).

## Ghi nhớ
Dummy head + con trỏ đuôi + gắn phần còn lại. Trộn `k` danh sách (bài 23) dùng hàng đợi ưu tiên hoặc trộn từng cặp theo kiểu chia để trị.
