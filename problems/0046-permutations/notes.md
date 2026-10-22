---
id: 46
title: Permutations
slug: permutations
difficulty: Medium
topics: Backtracking
date: 2026-10-22
time: O(n · n!)
space: O(n) (không tính kết quả)
status: Chưa nộp (LeetCode trong Chrome chưa đăng nhập)
---
## Đề bài
Cho mảng các số khác nhau, trả về mọi hoán vị.

## Cơ sở lý thuyết
- Hoán vị = dãy có thứ tự dùng mỗi phần tử đúng một lần. Có `n!` hoán vị.
- **Quay lui với mảng `used`**: ở mỗi vị trí, thử mọi phần tử chưa dùng; đánh dấu, đi sâu, rồi bỏ đánh dấu khi quay lui.
- Khác tổ hợp (bài 77): thứ tự quan trọng nên mỗi vị trí được chọn **bất kỳ** phần tử còn lại, không chỉ phần tử lớn hơn.

## Hướng xử lý
1. `go()`: nếu `cur` đủ `n` phần tử thì ghi lại.
2. Với mỗi `i` chưa dùng: đánh dấu, thêm `nums[i]`, gọi `go()`, gỡ ra và bỏ đánh dấu.

## Ý tưởng triển khai
- `for i in 0..<nums.count where !used[i]`.
- Thứ tự sinh ra chính là thứ tự từ điển theo chỉ số (ví dụ của đề in ra đúng thứ tự này).
- Test cục bộ: 6 phần tử → kiểm tra đủ 720 hoán vị khác nhau.

## Ví dụ chạy từng bước
**Input:** `nums = [1, 2, 3]`
**Output:** `[[1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1]]`

```
go: cur = []
├── chọn 1: cur = [1]
│   ├── chọn 2: [1,2] → chọn 3: [1,2,3] ghi
│   └── chọn 3: [1,3] → chọn 2: [1,3,2] ghi
├── chọn 2: cur = [2]
│   ├── chọn 1 → [2,1,3] ghi
│   └── chọn 3 → [2,3,1] ghi
└── chọn 3: cur = [3]
    ├── chọn 1 → [3,1,2] ghi
    └── chọn 2 → [3,2,1] ghi
```

## Ghi nhớ
Khuôn quay lui: **chọn → đi sâu → bỏ chọn**. Hoán vị dùng `used`; nếu mảng có phần tử trùng (bài 47) thì sắp xếp và bỏ qua phần tử giống phần tử trước chưa được dùng.
