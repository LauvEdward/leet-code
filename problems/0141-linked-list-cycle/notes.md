---
id: 141
title: Linked List Cycle
slug: linked-list-cycle
difficulty: Easy
topics: Linked List, Two Pointers, Hash Table
date: 2026-10-19
time: O(n)
space: O(1)
status: Chưa nộp (LeetCode trong Chrome chưa đăng nhập)
---
## Đề bài
Kiểm tra danh sách liên kết có chu trình hay không (có nút nào mà đi theo `next` sẽ quay lại nó).

## Cơ sở lý thuyết
- **Thuật toán Floyd (rùa và thỏ)**: con trỏ chậm đi 1 bước, con trỏ nhanh đi 2 bước mỗi lượt.
   - Không có chu trình → con trỏ nhanh chạm `nil`.
   - Có chu trình → khi cả hai đã vào vòng, khoảng cách giữa chúng (đo theo chiều đi) giảm đúng 1 mỗi lượt, nên chắc chắn gặp nhau sau tối đa một vòng.
- Cách dùng tập hợp các nút đã thăm cũng đúng nhưng tốn `O(n)` bộ nhớ; Floyd chỉ cần `O(1)`.
- So sánh **danh tính** đối tượng (`===`), không phải giá trị — hai nút khác nhau có thể cùng `val`.

## Hướng xử lý
1. `slow = fast = head`.
2. Chừng nào `fast` và `fast.next` khác `nil`: `slow` đi 1, `fast` đi 2; nếu `slow === fast` → có chu trình.
3. Thoát vòng lặp → không có chu trình.

## Ý tưởng triển khai
- Optional chaining `fast?.next?.next` cho gọn.
- Kiểm tra gặp nhau **sau** khi di chuyển (lúc đầu cả hai cùng ở `head`).
- Danh sách rỗng: điều kiện vòng lặp sai ngay → `false`.
- Test cục bộ: mọi độ dài 1…12 với mọi vị trí nối đuôi.

## Ví dụ chạy từng bước
**Input:** `head = [3, 2, 0, -4]`, `pos = 1` (nút `-4` trỏ ngược về nút `2`)
**Output:** `true`

```
Danh sách: 3 → 2 → 0 → -4 → (về 2)
Ban đầu:  slow = 3,  fast = 3
Lượt 1:   slow = 2,  fast = 0
Lượt 2:   slow = 0,  fast = 2     (0 → -4 → 2)
Lượt 3:   slow = -4, fast = -4    (2 → 0 → -4) → slow === fast → true
```

**Input:** `head = [1]`, `pos = -1` → **Output:** `false`

```
slow = fast = 1; fast.next = nil → không vào vòng lặp → false
```

## Ghi nhớ
Phát hiện chu trình với bộ nhớ `O(1)` → hai con trỏ tốc độ 1 và 2. Mở rộng (bài 142): sau khi gặp nhau, đưa một con trỏ về `head` rồi cùng đi tốc độ 1 — chỗ gặp lại là điểm bắt đầu chu trình.
