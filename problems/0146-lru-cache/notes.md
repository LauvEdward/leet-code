---
id: 146
title: LRU Cache
slug: lru-cache
difficulty: Medium
topics: Linked List, Hash Table, Design, Doubly-Linked List
date: 2026-10-20
time: O(1) mỗi thao tác
space: O(capacity)
status: Chưa nộp (LeetCode trong Chrome chưa đăng nhập)
---
## Đề bài
Thiết kế bộ nhớ đệm LRU (Least Recently Used) có dung lượng `capacity`: `get(key)` trả giá trị hoặc `-1`; `put(key, value)` thêm/cập nhật, và nếu vượt dung lượng thì bỏ khóa **lâu chưa dùng nhất**. Cả hai thao tác `O(1)`.

## Cơ sở lý thuyết
- Cần đồng thời: tra theo khóa `O(1)` (→ **bảng băm**) và duy trì thứ tự "dùng gần đây" với thao tác "đưa một phần tử bất kỳ lên đầu" và "bỏ phần tử cuối" đều `O(1)` (→ **danh sách liên kết đôi**).
- **Kết hợp**: bảng băm `key → nút`, nút nằm trong danh sách đôi xếp từ mới dùng nhất (đầu) tới lâu nhất (cuối). Có nút trong tay thì gỡ ra và chèn lại đầu đều `O(1)` nhờ con trỏ `prev`.
- **Hai nút giả** `head`, `tail` ở hai đầu để mọi thao tác chèn/gỡ không phải xét trường hợp danh sách rỗng hay nút ở biên.

## Hướng xử lý
1. `get(key)`: không có → `-1`; có → gỡ nút, chèn lên đầu, trả giá trị.
2. `put(key, value)`:
   - Khóa đã có → cập nhật giá trị, đưa lên đầu.
   - Khóa mới: nếu đầy thì gỡ nút sát `tail` (lâu nhất) và xóa khỏi bảng băm; tạo nút mới, ghi vào bảng băm, chèn lên đầu.

## Ý tưởng triển khai
- Lớp con `Node` lưu cả `key` để khi bỏ nút cuối còn biết khóa nào cần xóa khỏi bảng băm.
- Hai hàm phụ `remove(n)` và `addFront(n)` dùng chung cho mọi thao tác.
- Phải dùng `class` (kiểu tham chiếu) cho nút; `struct` sẽ bị sao chép và con trỏ không còn trỏ đúng.
- Với bài thiết kế, LeetCode yêu cầu đúng tên lớp `LRUCache`.
- Test cục bộ: 5000 thao tác ngẫu nhiên với dung lượng 1…4, đối chiếu một mô hình mảng đơn giản.

## Ví dụ chạy từng bước
**Input:** `LRUCache(2)`, `put(1, 1)`, `put(2, 2)`, `get(1)`, `put(3, 3)`, `get(2)`, `put(4, 4)`, `get(1)`, `get(3)`, `get(4)`
**Output:** `1`, `-1`, `-1`, `3`, `4`

Thứ tự danh sách viết từ mới dùng nhất → lâu nhất:

```
put(1,1): [1]
put(2,2): [2, 1]
get(1):   có → đưa lên đầu → [1, 2]                 trả 1
put(3,3): đầy → bỏ phần tử cuối là 2 → [3, 1]
get(2):   không có                                  trả -1
put(4,4): đầy → bỏ phần tử cuối là 1 → [4, 3]
get(1):   không có                                  trả -1
get(3):   có → [3, 4]                               trả 3
get(4):   có → [4, 3]                               trả 4
```

## Ghi nhớ
"Tra `O(1)` + thứ tự sử dụng `O(1)`" → bảng băm trỏ vào danh sách liên kết đôi có hai nút giả. Đây là câu hỏi thiết kế kinh điển; LFU Cache (bài 460) mở rộng thêm một tầng theo tần suất.
