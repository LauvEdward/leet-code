---
id: 73
title: Set Matrix Zeroes
slug: set-matrix-zeroes
difficulty: Medium
topics: Matrix, Hash Table
date: 2026-10-18
time: O(m · n)
space: O(m + n)
status: Chưa nộp (LeetCode trong Chrome chưa đăng nhập)
---
## Đề bài
Trong ma trận `m × n`, nếu một ô bằng `0` thì đặt **cả hàng và cả cột** của nó thành `0`. Làm tại chỗ.

## Cơ sở lý thuyết
- **Tách pha "ghi nhận" và pha "sửa"**: nếu vừa duyệt vừa gán 0, các số 0 mới gán sẽ bị coi là số 0 gốc và lan ra cả ma trận. Phải ghi lại vị trí các số 0 gốc trước, rồi mới sửa.
- Chỉ cần biết **hàng nào** và **cột nào** có số 0 — không cần từng tọa độ. Hai tập kích thước `m` và `n` là đủ.
- Bản `O(1)` bộ nhớ: dùng chính hàng đầu và cột đầu của ma trận làm hai tập đánh dấu, cộng thêm một biến riêng cho việc "cột đầu có số 0 không". Tiết kiệm bộ nhớ nhưng dễ sai thứ tự, nên ở đây dùng hai `Set` cho rõ.

## Hướng xử lý
1. Lượt 1: duyệt mọi ô, ô nào bằng 0 thì ghi hàng và cột của nó vào hai tập.
2. Lượt 2: ô nào có hàng hoặc cột nằm trong tập thì gán 0.

## Ý tưởng triển khai
- Hai vòng lặp đôi dùng `where` để lọc gọn.
- Test cục bộ so với định nghĩa trực tiếp ("hàng gốc có 0 hoặc cột gốc có 0") trên 1000 ma trận ngẫu nhiên.

## Ví dụ chạy từng bước
**Input:** `matrix = [[0, 1, 2, 0], [3, 4, 5, 2], [1, 3, 1, 5]]`
**Output:** `[[0, 0, 0, 0], [0, 4, 5, 0], [0, 3, 1, 0]]`

```
Lượt 1:
   (0,0) = 0 → rows = {0}, cols = {0}
   (0,3) = 0 → rows = {0}, cols = {0, 3}
   các ô khác khác 0
Lượt 2:
   hàng 0 nằm trong rows       → cả hàng 0 thành 0
   cột 0 và cột 3 nằm trong cols → (1,0), (1,3), (2,0), (2,3) thành 0
   các ô còn lại giữ nguyên: 4, 5, 3, 1
```

**Input:** `matrix = [[1, 1, 1], [1, 0, 1], [1, 1, 1]]` → **Output:** `[[1, 0, 1], [0, 0, 0], [1, 0, 1]]`

```
Lượt 1: rows = {1}, cols = {1}
Lượt 2: hàng 1 và cột 1 thành 0
```

## Ghi nhớ
Cập nhật tại chỗ mà giá trị mới ảnh hưởng tới việc đọc giá trị cũ → ghi nhận trước, sửa sau (hoặc mã hóa trạng thái cũ/mới vào cùng ô như bài 289).
