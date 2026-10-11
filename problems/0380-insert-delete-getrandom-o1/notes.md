---
id: 380
title: Insert Delete GetRandom O(1)
slug: insert-delete-getrandom-o1
difficulty: Medium
topics: Array / String, Hash Table, Design, Randomized
date: 2026-10-11
time: O(1) trung bình mỗi thao tác
space: O(n)
status: Accepted
---
## Đề bài
Thiết kế lớp `RandomizedSet` với ba thao tác đều `O(1)` trung bình: `insert(val)` (trả `false` nếu đã có), `remove(val)` (trả `false` nếu không có), `getRandom()` (trả một phần tử ngẫu nhiên với xác suất đều).

## Cơ sở lý thuyết
- **Mỗi cấu trúc mạnh một việc**: bảng băm tra/chèn/xóa `O(1)` nhưng không lấy ngẫu nhiên `O(1)` được; mảng lấy ngẫu nhiên theo chỉ số `O(1)` nhưng xóa ở giữa mất `O(n)`.
- **Kết hợp hai cấu trúc**: mảng giữ các giá trị, bảng băm ánh xạ `giá trị → vị trí trong mảng`.
- **Xóa bằng hoán đổi với phần tử cuối (swap-remove)**: thứ tự trong mảng không quan trọng, nên muốn xóa ô `i` thì chép phần tử cuối vào ô `i` rồi bỏ ô cuối — `O(1)`.

## Hướng xử lý
1. `insert`: nếu đã có trong bảng băm → `false`. Ngược lại thêm vào cuối mảng, ghi vị trí.
2. `remove`: tra vị trí `i`. Chép phần tử cuối `last` vào ô `i`, cập nhật vị trí của `last`, bỏ ô cuối, xóa `val` khỏi bảng băm.
3. `getRandom`: chọn ngẫu nhiên một chỉ số của mảng.

## Ý tưởng triển khai
- **Thứ tự cập nhật trong `remove`**: gán `idx[last] = i` **trước**, rồi mới `idx[val] = nil`. Khi `val` chính là phần tử cuối (`last == val`), làm ngược lại sẽ để sót một mục trong bảng băm.
- `arr.randomElement()!` — đề đảm bảo `getRandom` chỉ được gọi khi tập không rỗng.
- Với bài thiết kế, LeetCode yêu cầu đúng tên lớp `RandomizedSet` thay cho `class Solution`.

## Ví dụ chạy từng bước
**Input:** `insert(1)`, `remove(2)`, `insert(2)`, `getRandom()`, `remove(1)`, `insert(2)`, `getRandom()`
**Output:** `true`, `false`, `true`, `1 hoặc 2`, `true`, `false`, `2`

```
insert(1): chưa có → arr = [1],    idx = {1: 0}        → true
remove(2): không có trong idx                          → false
insert(2): chưa có → arr = [1, 2], idx = {1: 0, 2: 1}  → true
getRandom(): chọn ngẫu nhiên trong [1, 2]              → 1 hoặc 2
remove(1): i = 0, last = 2
           arr[0] = 2      → arr = [2, 2]
           idx[2] = 0
           removeLast      → arr = [2]
           idx[1] = nil    → idx = {2: 0}              → true
insert(2): đã có                                       → false
getRandom(): chỉ còn [2]                               → 2
```

**Ca biên — xóa đúng phần tử cuối:** `arr = [7]`, `idx = {7: 0}`, gọi `remove(7)`

```
i = 0, last = 7 → arr[0] = 7, idx[7] = 0, removeLast → arr = [], idx[7] = nil → idx = {}
```

## Ghi nhớ
Cần cả "tra theo giá trị `O(1)`" lẫn "truy cập theo chỉ số `O(1)`" → mảng + bảng băm vị trí, xóa bằng swap với phần tử cuối. Mẫu này xuất hiện lại ở LRU/LFU cache và các bài lấy mẫu ngẫu nhiên.
