---
id: 39
title: Combination Sum
slug: combination-sum
difficulty: Medium
topics: Backtracking, Array
date: 2026-10-22
time: Hàm mũ theo target / min(candidates)
space: O(target / min(candidates))
status: Chưa nộp (LeetCode trong Chrome chưa đăng nhập)
---
## Đề bài
Cho mảng `candidates` gồm các số nguyên dương khác nhau và `target`. Tìm mọi tổ hợp (không tính thứ tự) có tổng bằng `target`; mỗi số được dùng **không giới hạn** số lần.

## Cơ sở lý thuyết
- **Quay lui với `start`** để không sinh cùng một tập theo nhiều thứ tự (như bài 77).
- **Cho phép dùng lại**: sau khi chọn `a[i]`, lời gọi tiếp vẫn bắt đầu từ `i` (không phải `i + 1`).
- **Sắp xếp để cắt nhánh**: khi `a[i]` đã lớn hơn phần còn thiếu, mọi số sau còn lớn hơn → `break` cả vòng lặp.

## Hướng xử lý
1. Sắp `candidates` tăng dần.
2. `go(start, rest)`: `rest == 0` → ghi `cur`.
3. Với `i` từ `start`: nếu `a[i] > rest` thì dừng; ngược lại thêm `a[i]`, gọi `go(i, rest - a[i])`, gỡ ra.

## Ý tưởng triển khai
- Truyền `rest` (phần còn thiếu) thay vì tổng hiện tại → điều kiện cắt nhánh gọn.
- Test cục bộ: số tổ hợp tìm được phải bằng số cách đếm bằng quy hoạch động "đổi tiền" (không tính thứ tự), mỗi tổ hợp có tổng đúng và không trùng.

## Ví dụ chạy từng bước
**Input:** `candidates = [2, 3, 6, 7]`, `target = 7`
**Output:** `[[2, 2, 3], [7]]`

```
go(0, 7)
├── 2 → go(0, 5)
│   ├── 2 → go(0, 3)
│   │   ├── 2 → go(0, 1): 2 > 1 → dừng
│   │   └── 3 → go(1, 0) → ghi [2, 2, 3]
│   │       (6 > 3 → dừng)
│   ├── 3 → go(1, 2): 3 > 2 → dừng
│   └── 6 > 5 → dừng
├── 3 → go(1, 4)
│   ├── 3 → go(1, 1): 3 > 1 → dừng
│   └── 6 > 4 → dừng
├── 6 → go(2, 1): 6 > 1 → dừng
└── 7 → go(3, 0) → ghi [7]
```

**Input:** `candidates = [2]`, `target = 1` → **Output:** `[]`

## Ghi nhớ
Ba biến thể cùng khuôn: dùng lại không giới hạn → gọi tiếp với `i`; mỗi số một lần → `i + 1`; mảng có trùng (bài 40) → thêm "bỏ qua phần tử giống phần tử trước ở cùng tầng".
