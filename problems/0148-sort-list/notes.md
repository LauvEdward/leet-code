---
id: 148
title: Sort List
slug: sort-list
difficulty: Medium
topics: Divide & Conquer, Linked List, Sorting, Merge Sort
date: 2026-10-22
time: O(n log n)
space: O(log n) (ngăn xếp đệ quy)
status: Chưa nộp (LeetCode trong Chrome chưa đăng nhập)
---
## Đề bài
Sắp xếp tăng dần một danh sách liên kết trong `O(n log n)`.

## Cơ sở lý thuyết
- **Sắp xếp trộn (merge sort)** hợp với danh sách liên kết nhất: chia đôi, sắp từng nửa, trộn lại. Trộn hai danh sách đã sắp chỉ cần nối lại con trỏ (bài 21), không tốn bộ nhớ phụ như với mảng.
- Quicksort và heapsort dựa vào truy cập ngẫu nhiên nên không hợp với danh sách liên kết.
- **Tìm điểm giữa bằng hai con trỏ** (chậm 1 bước, nhanh 2 bước). Cho `fast` bắt đầu ở `head.next` để với danh sách 2 phần tử, `slow` dừng ở phần tử **đầu** — nếu không, nửa đầu sẽ gồm cả hai phần tử và đệ quy vô hạn.
- Độ sâu đệ quy `O(log n)`; bản lặp từ dưới lên (trộn các đoạn dài 1, 2, 4…) đạt `O(1)` bộ nhớ như câu hỏi thêm của đề.

## Hướng xử lý
1. Danh sách rỗng hoặc 1 phần tử → đã sắp.
2. Tìm `slow` là nút cuối của nửa đầu; cắt `slow.next = nil`.
3. Sắp đệ quy hai nửa rồi trộn.

## Ý tưởng triển khai
- `while let f = fast, let ff = f.next` di chuyển `fast` hai bước an toàn.
- Hàm `merge` giống hệt bài 21.
- Test cục bộ: 2000 danh sách ngẫu nhiên và một danh sách 50.000 phần tử, so với `sorted()`.

## Ví dụ chạy từng bước
**Input:** `head = [4, 2, 1, 3]`
**Output:** `[1, 2, 3, 4]`

```
sort(4 → 2 → 1 → 3):
   slow = 4, fast = 2 → fast.next = 1 → slow = 2, fast = 3 → fast.next = nil → dừng
   cắt sau 2: nửa đầu 4 → 2, nửa sau 1 → 3
   sort(4 → 2): slow = 4, fast = 2 → không đi tiếp → cắt: 4 | 2 → trộn → 2 → 4
   sort(1 → 3): cắt: 1 | 3 → trộn → 1 → 3
   trộn(2 → 4, 1 → 3): 1, 2, 3, 4
```

**Input:** `head = []` → **Output:** `[]`

## Ghi nhớ
Sắp xếp danh sách liên kết → merge sort; tìm giữa bằng hai con trỏ và chú ý vị trí bắt đầu của `fast` để không chia lệch với 2 phần tử.
