---
id: 57
title: Insert Interval
slug: insert-interval
difficulty: Medium
topics: Intervals, Array
date: 2026-10-19
time: O(n)
space: O(n)
status: Chưa nộp (LeetCode trong Chrome chưa đăng nhập)
---
## Đề bài
Cho danh sách khoảng **rời nhau, đã sắp theo điểm đầu** và một khoảng mới. Chèn khoảng mới vào, gộp nếu cần, để danh sách vẫn rời nhau và đã sắp.

## Cơ sở lý thuyết
- Vì danh sách đã sắp và rời nhau, so với khoảng mới `[s, e]` nó chia thành **ba phần liên tiếp**:
   1. Các khoảng kết thúc trước `s` — nằm hẳn bên trái.
   2. Các khoảng chồng lên `[s, e]` — phải gộp với nó.
   3. Các khoảng bắt đầu sau `e` — nằm hẳn bên phải.
- Không cần sắp xếp lại (khác bài 56), nên `O(n)`.

## Hướng xử lý
1. Chép các khoảng có `end < s` vào kết quả.
2. Với các khoảng có `start <= e` (giờ chắc chắn chồng lên): mở rộng `cur = [min(s, start), max(e, end)]`.
3. Thêm `cur`.
4. Chép phần còn lại.

## Ý tưởng triển khai
- Ba vòng `while` nối tiếp nhau trên cùng con trỏ `i` — mỗi vòng ứng với một phần.
- Điều kiện vòng 2 dùng `cur[1]` đã được cập nhật, vì khoảng gộp có thể dài ra và nuốt thêm khoảng tiếp theo.
- Danh sách rỗng: vòng 1, 2 không chạy, chỉ thêm `cur`.
- Test cục bộ: so với cách "thêm vào rồi gộp lại như bài 56".

## Ví dụ chạy từng bước
**Input:** `intervals = [[1, 2], [3, 5], [6, 7], [8, 10], [12, 16]]`, `newInterval = [4, 8]`
**Output:** `[[1, 2], [3, 10], [12, 16]]`

```
cur = [4, 8]
Vòng 1 (end < 4):    [1,2] → 2 < 4 → chép          res = [[1,2]]
                     [3,5] → 5 < 4 sai → dừng
Vòng 2 (start <= cur[1]):
                     [3,5]:   3 <= 8  → cur = [3, 8]
                     [6,7]:   6 <= 8  → cur = [3, 8]
                     [8,10]:  8 <= 8  → cur = [3, 10]
                     [12,16]: 12 <= 10 sai → dừng
Thêm cur:                                          res = [[1,2], [3,10]]
Vòng 3: chép [12,16]                               res = [[1,2], [3,10], [12,16]]
```

**Input:** `intervals = [[1, 5]]`, `newInterval = [6, 8]` → **Output:** `[[1, 5], [6, 8]]`

```
Vòng 1: 5 < 6 → chép [1,5] · Vòng 2: không còn gì · thêm [6,8]
```

## Ghi nhớ
Dữ liệu đã sắp và rời nhau → chia thành "trái / chồng / phải" bằng ba vòng lặp nối tiếp, không cần sắp lại.
