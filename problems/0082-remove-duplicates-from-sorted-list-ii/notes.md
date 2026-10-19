---
id: 82
title: Remove Duplicates from Sorted List II
slug: remove-duplicates-from-sorted-list-ii
difficulty: Medium
topics: Linked List, Two Pointers
date: 2026-10-19
time: O(n)
space: O(1)
status: Chưa nộp (LeetCode trong Chrome chưa đăng nhập)
---
## Đề bài
Cho danh sách liên kết đã sắp tăng. Xóa **toàn bộ** các nút có giá trị bị lặp (không giữ lại bản nào), chỉ giữ những giá trị xuất hiện đúng một lần.

## Cơ sở lý thuyết
- Danh sách đã sắp → các nút cùng giá trị nằm thành **một cụm liền nhau**. Chỉ cần nhìn nút kế tiếp là biết nút hiện tại có bị lặp không.
- Khác bài 83 (giữ lại một bản): ở đây phải xóa cả nút đầu cụm, nên cần một con trỏ `prev` đứng **trước** cụm — và nút giả cho trường hợp cụm nằm ngay đầu danh sách.

## Hướng xử lý
1. `dummy → head`, `prev = dummy`, `cur = head`.
2. Nếu `cur` và `cur.next` cùng giá trị: đi qua hết cụm tới nút `p` đầu tiên khác giá trị; nối `prev.next = p`; `cur = p` (`prev` đứng yên vì nút `p` chưa chắc đã giữ được).
3. Ngược lại `cur` là giá trị duy nhất: `prev = cur`, `cur = cur.next`.

## Ý tưởng triển khai
- `while let q = p, q.val == c.val { p = q.next }` bỏ qua cả cụm, kể cả khi cụm kéo tới cuối danh sách (`p` thành `nil`).
- `prev` chỉ tiến khi chắc chắn giữ nút — nhờ vậy hai cụm lặp liền nhau (ví dụ `3, 3, 4, 4`) vẫn bị xóa hết.
- Test cục bộ: so với "giữ những giá trị có số lần xuất hiện bằng 1" trên 3000 danh sách ngẫu nhiên.

## Ví dụ chạy từng bước
**Input:** `head = [1, 2, 3, 3, 4, 4, 5]`
**Output:** `[1, 2, 5]`

```
cur=1: kế là 2, khác → giữ, prev = 1
cur=2: kế là 3, khác → giữ, prev = 2
cur=3: kế là 3, bằng → bỏ cụm 3,3 → p = 4; prev(2).next = 4, cur = 4
cur=4: kế là 4, bằng → bỏ cụm 4,4 → p = 5; prev(2).next = 5, cur = 5
cur=5: không có kế → giữ, prev = 5
Kết quả: 1 → 2 → 5
```

**Input:** `head = [1, 1, 1, 2, 3]` → **Output:** `[2, 3]`

```
cur=1: bằng nút kế → bỏ cụm 1,1,1 → dummy.next = 2   (nhờ dummy nên xóa được đầu danh sách)
cur=2: giữ · cur=3: giữ
```

## Ghi nhớ
Xóa nút trong danh sách liên kết → luôn đứng ở nút **trước** và dùng dummy head. Chỉ tiến `prev` khi chắc chắn giữ nút hiện tại.
