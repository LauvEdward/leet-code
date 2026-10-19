---
id: 138
title: Copy List with Random Pointer
slug: copy-list-with-random-pointer
difficulty: Medium
topics: Linked List, Hash Table
date: 2026-10-19
time: O(n)
space: O(n)
status: Chưa nộp (LeetCode trong Chrome chưa đăng nhập)
---
## Đề bài
Mỗi nút của danh sách liên kết có thêm con trỏ `random` trỏ tới một nút bất kỳ trong danh sách (hoặc `nil`). Tạo **bản sao sâu**: toàn nút mới, với `next` và `random` trỏ tới các nút mới tương ứng.

## Cơ sở lý thuyết
- Khó khăn: khi tạo bản sao của một nút, nút mà `random` của nó trỏ tới có thể **chưa được tạo**.
- **Hai lượt + bảng ánh xạ**: lượt 1 tạo mọi nút mới và ghi `nút cũ → nút mới`; lượt 2 nối `next` và `random` bằng cách tra bảng. Khi đó mọi nút đích đều đã tồn tại.
- Khóa bảng băm là **danh tính** của nút cũ (`ObjectIdentifier`), vì nhiều nút có thể trùng `val`.
- Cách `O(1)` bộ nhớ phụ: chèn mỗi nút mới ngay sau nút cũ (`A → A' → B → B'`), khi đó `A'.random = A.random.next`, rồi tách hai danh sách ra.

## Hướng xử lý
1. Lượt 1: duyệt danh sách cũ, tạo `Node(x.val)` cho mỗi nút, lưu vào `m[ObjectIdentifier(x)]`.
2. Lượt 2: với mỗi nút cũ `x`, lấy bản sao `c`; gán `c.next = m[x.next]`, `c.random = m[x.random]`.
3. Trả về bản sao của `head`.

## Ý tưởng triển khai
- `ObjectIdentifier(x)` dùng được làm khóa `Dictionary` cho bất kỳ đối tượng lớp nào, không cần lớp `Node` phải `Hashable`.
- `if let nx = x.next` / `if let r = x.random` để bỏ qua các con trỏ `nil`.
- Test cục bộ kiểm tra: không nút mới nào trùng nút cũ, giá trị đúng, `random` trỏ đúng vị trí trong danh sách mới.

## Ví dụ chạy từng bước
**Input:** `head = [[7, null], [13, 0], [11, 4], [10, 2], [1, 0]]` (cặp `[val, chỉ số random]`)
**Output:** cấu trúc y hệt, toàn nút mới

```
Lượt 1 — tạo nút mới:  7 → 7',  13 → 13',  11 → 11',  10 → 10',  1 → 1'

Lượt 2 — nối con trỏ:
   7':  next = 13'  random = nil
   13': next = 11'  random = m[7]  = 7'
   11': next = 10'  random = m[1]  = 1'
   10': next = 1'   random = m[11] = 11'
   1':  next = nil  random = m[7]  = 7'
Trả về m[7] = 7'
```

Nếu làm một lượt: khi sao chép `11`, nút `1` (đích của `random`) chưa có bản sao — vì vậy cần lượt 1 tạo trước mọi nút.

**Input:** `head = []` → **Output:** `[]`

## Ghi nhớ
Sao chép cấu trúc có con trỏ tùy ý (danh sách có random, đồ thị — bài 133) → bảng ánh xạ cũ → mới, tạo nút trước rồi nối cạnh sau.
