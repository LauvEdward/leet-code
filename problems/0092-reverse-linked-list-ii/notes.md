---
id: 92
title: Reverse Linked List II
slug: reverse-linked-list-ii
difficulty: Medium
topics: Linked List
date: 2026-10-19
time: O(n)
space: O(1)
status: Chưa nộp (LeetCode trong Chrome chưa đăng nhập)
---
## Đề bài
Đảo ngược đoạn danh sách liên kết từ vị trí `left` tới `right` (đánh số từ 1), làm trong một lượt.

## Cơ sở lý thuyết
- **Đảo bằng cách chèn đầu (head insertion)**: giữ `prev` là nút đứng ngay trước đoạn cần đảo và `cur` là nút đầu đoạn. Mỗi bước nhấc nút **ngay sau `cur`** lên đứng ngay sau `prev`. Sau `right - left` bước, đoạn bị đảo hoàn toàn, còn `cur` trôi dần về cuối đoạn và luôn nối với phần sau đoạn.
- **Nút giả trước `head`** để trường hợp `left = 1` (đoạn bắt đầu từ đầu danh sách) không cần xử lý riêng.

## Hướng xử lý
1. `dummy → head`; đi `left - 1` bước để `prev` đứng trước đoạn.
2. `cur = prev.next` (cố định trong suốt quá trình).
3. Lặp `right - left` lần: `x = cur.next`; `cur.next = x.next`; `x.next = prev.next`; `prev.next = x`.
4. Trả về `dummy.next`.

## Ý tưởng triển khai
- Thứ tự ba phép gán quan trọng: tách `x` ra khỏi chỗ cũ trước (`cur.next = x.next`), rồi mới chèn nó vào đầu đoạn.
- `for _ in 1..<left` với `left = 1` là khoảng rỗng — `prev` ở lại `dummy`.
- Test cục bộ: mọi cặp `(left, right)` trên danh sách dài 1 tới 8.

## Ví dụ chạy từng bước
**Input:** `head = [1, 2, 3, 4, 5]`, `left = 2`, `right = 4`
**Output:** `[1, 4, 3, 2, 5]`

```
prev = 1, cur = 2                       danh sách: 1 → 2 → 3 → 4 → 5
Lần 1: x = 3 → nhấc 3 lên sau prev      danh sách: 1 → 3 → 2 → 4 → 5
Lần 2: x = 4 → nhấc 4 lên sau prev      danh sách: 1 → 4 → 3 → 2 → 5
(cur = 2 luôn trỏ tới phần sau đoạn: 2 → 4, rồi 2 → 5)
```

**Input:** `head = [3, 5]`, `left = 1`, `right = 2` → **Output:** `[5, 3]`

```
prev = dummy, cur = 3
Lần 1: x = 5 → cur.next = nil, 5.next = 3, dummy.next = 5 → 5 → 3
```

## Ghi nhớ
Đảo một đoạn danh sách liên kết → dummy head + "nhấc nút sau `cur` lên đầu đoạn". Cùng một vòng lặp này dùng lại nguyên cho bài 25 (đảo theo nhóm `k`).
