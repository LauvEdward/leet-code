---
id: 25
title: Reverse Nodes in k-Group
slug: reverse-nodes-in-k-group
difficulty: Hard
topics: Linked List, Recursion
date: 2026-10-19
time: O(n)
space: O(1)
status: Chưa nộp (LeetCode trong Chrome chưa đăng nhập)
---
## Đề bài
Đảo ngược danh sách liên kết theo từng nhóm `k` nút liên tiếp. Nhóm cuối nếu không đủ `k` nút thì giữ nguyên. Chỉ được đổi con trỏ, không đổi giá trị.

## Cơ sở lý thuyết
- Mỗi nhóm là một bài 92 (đảo đoạn) với `left`, `right` cách nhau `k - 1`.
- **Kiểm tra trước, đảo sau**: phải biết chắc nhóm có đủ `k` nút trước khi đảo, vì nhóm thiếu phải giữ nguyên.
- Sau khi đảo bằng cách chèn đầu, nút đầu nhóm cũ (`first`) trở thành **nút cuối** của nhóm mới — chính là `prev` cho nhóm kế tiếp.

## Hướng xử lý
1. `dummy → head`, `prev = dummy`.
2. Lặp:
   - Đếm thử `k` nút sau `prev`; thiếu thì trả về `dummy.next`.
   - `first = prev.next`; lặp `k - 1` lần nhấc nút sau `first` lên đầu nhóm (sau `prev`).
   - `prev = first`.

## Ý tưởng triển khai
- Biến `check` chỉ để đếm, không thay đổi danh sách.
- Vòng `while true` thoát bằng `return` khi nhóm không đủ — danh sách hết đúng lúc cũng rơi vào trường hợp này.
- Test cục bộ: mọi `n` từ 1 tới 12 và mọi `k` từ 1 tới `n`; `k = 1` không đổi gì.

## Ví dụ chạy từng bước
**Input:** `head = [1, 2, 3, 4, 5]`, `k = 2`
**Output:** `[2, 1, 4, 3, 5]`

```
prev = dummy
Nhóm 1: đếm 1, 2 → đủ. first = 1
   nhấc 2 lên đầu: dummy → 2 → 1 → 3 → 4 → 5
   prev = 1
Nhóm 2: đếm 3, 4 → đủ. first = 3
   nhấc 4 lên đầu: … 1 → 4 → 3 → 5
   prev = 3
Nhóm 3: đếm 5, rồi gặp nil → thiếu → trả về
Kết quả: 2 → 1 → 4 → 3 → 5
```

**Input:** `head = [1, 2, 3, 4, 5]`, `k = 3` → **Output:** `[3, 2, 1, 4, 5]`

```
Nhóm 1: 1, 2, 3 đủ → nhấc 2 rồi 3 lên đầu → 3 → 2 → 1 → 4 → 5, prev = 1
Nhóm 2: 4, 5, nil → thiếu → giữ nguyên
```

## Ghi nhớ
Bài "Hard" này là bài 92 lặp lại: kiểm tra đủ `k` nút → đảo bằng chèn đầu → nút đầu cũ thành `prev` mới. Tách thành các bước nhỏ đã quen là hết khó.
