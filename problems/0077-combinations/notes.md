---
id: 77
title: Combinations
slug: combinations
difficulty: Medium
topics: Backtracking
date: 2026-10-22
time: O(C(n, k) · k)
space: O(k) (không tính kết quả)
status: Chưa nộp (LeetCode trong Chrome chưa đăng nhập)
---
## Đề bài
Trả về mọi tổ hợp `k` số chọn từ `1…n` (không tính thứ tự).

## Cơ sở lý thuyết
- **Tổ hợp không lặp**: để mỗi tập chỉ sinh một lần, luôn chọn các số theo thứ tự **tăng dần** — lần chọn sau chỉ lấy số lớn hơn số vừa chọn (tham số `start`).
- **Cắt nhánh theo số lượng còn cần**: nếu còn cần `k - cur.count` số mà các số từ `start` tới `n` không đủ, nhánh đó vô ích. Vì vậy số được chọn ở bước hiện tại không vượt quá `n - (k - cur.count) + 1`.
- Số kết quả là `C(n, k)`.

## Hướng xử lý
1. `go(start)`: nếu đã đủ `k` số thì ghi lại.
2. Thử `x` từ `start` tới `n - (cần) + 1`: thêm `x`, gọi `go(x + 1)`, gỡ `x` ra.

## Ý tưởng triển khai
- Một mảng `cur` dùng chung với `append`/`removeLast` (quay lui tại chỗ).
- Kiểm tra `start > giới hạn` trước khi dựng khoảng `start...giới hạn` để không tạo khoảng ngược (Swift sẽ crash).
- Test cục bộ: mọi `n ≤ 9`, kiểm tra số lượng bằng `C(n, k)`, không trùng, mỗi tổ hợp tăng dần và hợp lệ.

## Ví dụ chạy từng bước
**Input:** `n = 4`, `k = 2`
**Output:** `[[1, 2], [1, 3], [1, 4], [2, 3], [2, 4], [3, 4]]`

```
go(1): cần 2 số → x chạy 1…3 (x = 4 thì không còn số nào sau nó)
├── x=1 → go(2): cần 1 số → x chạy 2…4 → ghi [1,2], [1,3], [1,4]
├── x=2 → go(3): x chạy 3…4 → ghi [2,3], [2,4]
└── x=3 → go(4): x chạy 4…4 → ghi [3,4]
```

**Input:** `n = 1`, `k = 1` → **Output:** `[[1]]`

## Ghi nhớ
Tổ hợp (không thứ tự) → chọn tăng dần với `start`; hoán vị (có thứ tự) → mảng `used` (bài 46). Cắt nhánh theo "còn đủ phần tử không" giúp nhanh hơn rõ rệt.
