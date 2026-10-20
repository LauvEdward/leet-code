---
id: 61
title: Rotate List
slug: rotate-list
difficulty: Medium
topics: Linked List, Two Pointers
date: 2026-10-20
time: O(n)
space: O(1)
status: Chưa nộp (LeetCode trong Chrome chưa đăng nhập)
---
## Đề bài
Xoay danh sách liên kết sang phải `k` vị trí: `k` nút cuối chuyển lên đầu. `k` có thể rất lớn (tới `2 × 10⁹`).

## Cơ sở lý thuyết
- Xoay `n` vị trí (với `n` là độ dài) trả về đúng danh sách cũ → chỉ cần xoay `k % n`.
- **Nối thành vòng rồi cắt**: nối đuôi vào đầu tạo một vòng tròn; xoay chỉ là chọn lại chỗ cắt. Đầu mới là nút thứ `n - k % n` (đếm từ 0), đuôi mới đứng ngay trước nó.
- Không cần di chuyển dữ liệu hay đảo danh sách, chỉ sửa hai con trỏ.

## Hướng xử lý
1. Danh sách rỗng → trả `nil`.
2. Đi tới đuôi, đếm độ dài `n`.
3. `tail.next = head` (nối vòng).
4. Từ `head` đi `n - k % n - 1` bước tới đuôi mới; đầu mới là nút sau nó; cắt `newTail.next = nil`.

## Ý tưởng triển khai
- `guard let head` một lần ở đầu, sau đó làm việc với nút không optional.
- Khi `k % n == 0`, số bước là `n - 1` → đuôi mới chính là đuôi cũ → cắt lại đúng chỗ cũ, danh sách không đổi.
- Test cục bộ: mọi độ dài 1…7 với `k` từ 0 tới 15, và một ca `k = 2 × 10⁹`.

## Ví dụ chạy từng bước
**Input:** `head = [1, 2, 3, 4, 5]`, `k = 2`
**Output:** `[4, 5, 1, 2, 3]`

```
Đếm: n = 5, tail = 5
Nối vòng: 5 → 1
Số bước tới đuôi mới: 5 - 2 % 5 - 1 = 2 → từ 1 đi 2 bước: 1 → 2 → 3, newTail = 3
newHead = 3.next = 4; cắt 3.next = nil
Kết quả: 4 → 5 → 1 → 2 → 3
```

**Input:** `head = [0, 1, 2]`, `k = 4` → **Output:** `[2, 0, 1]`

```
n = 3, k % n = 1 → số bước 3 - 1 - 1 = 1 → từ 0 đi 1 bước: newTail = 1
newHead = 1.next = 2; cắt 1.next = nil → kết quả 2 → 0 → 1
```

## Ghi nhớ
Xoay vòng một dãy → luôn lấy `k % n` trước. Với danh sách liên kết: nối vòng rồi cắt lại.
