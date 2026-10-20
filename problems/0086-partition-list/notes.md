---
id: 86
title: Partition List
slug: partition-list
difficulty: Medium
topics: Linked List, Two Pointers
date: 2026-10-20
time: O(n)
space: O(1)
status: Chưa nộp (LeetCode trong Chrome chưa đăng nhập)
---
## Đề bài
Sắp lại danh sách liên kết sao cho mọi nút nhỏ hơn `x` đứng trước mọi nút lớn hơn hoặc bằng `x`, **giữ nguyên thứ tự tương đối** trong mỗi phần.

## Cơ sở lý thuyết
- **Phân hoạch ổn định (stable partition)** trên danh sách liên kết: tách thành hai danh sách con theo điều kiện, mỗi danh sách giữ thứ tự gặp, rồi nối lại. Không cần chép dữ liệu, chỉ nối lại con trỏ.
- **Hai nút giả** làm đầu cho hai danh sách con để không phải xử lý trường hợp danh sách con còn rỗng.

## Hướng xử lý
1. Hai danh sách `small` (nhỏ hơn `x`) và `big` (còn lại), mỗi cái có con trỏ đuôi.
2. Duyệt danh sách gốc, gắn mỗi nút vào đuôi danh sách tương ứng.
3. Cắt đuôi `big` (`b.next = nil`), nối đuôi `small` vào đầu thật của `big`.

## Ý tưởng triển khai
- `b.next = nil` là bắt buộc: nút cuối của `big` vẫn còn trỏ tới nút kế tiếp trong danh sách gốc (có thể là một nút của `small`) → không cắt sẽ tạo vòng.
- Trả về `small.next`; nếu `small` rỗng thì nó chính là `big.next`.
- Test cục bộ: so với `filter` theo hai điều kiện rồi ghép lại.

## Ví dụ chạy từng bước
**Input:** `head = [1, 4, 3, 2, 5, 2]`, `x = 3`
**Output:** `[1, 2, 2, 4, 3, 5]`

```
1 < 3 → small: 1
4     → big:   4
3     → big:   4, 3
2 < 3 → small: 1, 2
5     → big:   4, 3, 5
2 < 3 → small: 1, 2, 2
Cắt: 5.next = nil   (trước đó 5 vẫn trỏ tới nút 2 cuối)
Nối: small (1, 2, 2) → big (4, 3, 5)
```

**Input:** `head = [2, 1]`, `x = 2` → **Output:** `[1, 2]`

```
2 → big: 2 · 1 → small: 1 · cắt 2.next (đang trỏ tới 1) → nối 1 → 2
```

## Ghi nhớ
Phân loại phần tử của danh sách liên kết → nhiều nút giả, mỗi loại một danh sách, nối lại ở cuối. Luôn nhớ cắt đuôi danh sách cuối cùng.
