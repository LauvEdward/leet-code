---
id: 56
title: Merge Intervals
slug: merge-intervals
difficulty: Medium
topics: Intervals, Array, Sorting
date: 2026-10-19
time: O(n log n)
space: O(n)
status: Chưa nộp (LeetCode trong Chrome chưa đăng nhập)
---
## Đề bài
Cho danh sách các khoảng `[start, end]`, gộp mọi khoảng chồng lên nhau và trả về danh sách khoảng rời nhau phủ đúng cùng tập điểm.

## Cơ sở lý thuyết
- **Sắp xếp theo điểm đầu** biến bài toán hai chiều thành một lượt quét: sau khi sắp, một khoảng chỉ có thể chồng lên **khoảng vừa gộp gần nhất**, không cần so với các khoảng cũ hơn.
- Hai khoảng `[a, b]` và `[c, d]` với `a ≤ c` chồng nhau khi `c ≤ b` (đề tính cả trường hợp chạm nhau, ví dụ `[1, 4]` và `[4, 5]`).
- Khi gộp, điểm cuối mới là `max(b, d)` — không phải `d`, vì khoảng sau có thể nằm trọn trong khoảng trước.

## Hướng xử lý
1. Sắp tăng theo điểm đầu.
2. Duyệt: nếu khoảng hiện tại bắt đầu không muộn hơn điểm cuối của khoảng cuối trong kết quả thì nới điểm cuối đó; ngược lại thêm khoảng mới.

## Ý tưởng triển khai
- `if let last = res.last, x[0] <= last[1]` — gộp điều kiện "có khoảng trước" và "chồng nhau" trong một dòng.
- Sửa trực tiếp `res[res.count - 1][1]`.
- Test cục bộ: tô các điểm (nhân đôi tọa độ để phân biệt `[1,2],[3,4]` với `[1,4]`) rồi đọc lại các đoạn, so với kết quả.

## Ví dụ chạy từng bước
**Input:** `intervals = [[1, 3], [2, 6], [8, 10], [15, 18]]`
**Output:** `[[1, 6], [8, 10], [15, 18]]`

```
Sắp theo điểm đầu: [[1,3], [2,6], [8,10], [15,18]] (đã sắp sẵn)
[1,3]:   res rỗng → thêm                     res = [[1,3]]
[2,6]:   2 <= 3 → nới cuối = max(3, 6) = 6   res = [[1,6]]
[8,10]:  8 > 6  → thêm                       res = [[1,6], [8,10]]
[15,18]: 15 > 10 → thêm                      res = [[1,6], [8,10], [15,18]]
```

**Input:** `intervals = [[4, 7], [1, 4]]` → **Output:** `[[1, 7]]`

```
Sắp: [[1,4], [4,7]]
[1,4] → thêm · [4,7]: 4 <= 4 (chạm nhau vẫn gộp) → [1,7]
```

**Input:** `intervals = [[1, 4], [2, 3]]` → **Output:** `[[1, 4]]` (dùng `max` nên không bị co lại thành `[1, 3]`).

## Ghi nhớ
Bài khoảng → **sắp xếp trước** (theo đầu hoặc theo cuối tùy mục tiêu), rồi một lượt quét so với khoảng gần nhất. Gộp khoảng: sắp theo đầu. Chọn nhiều khoảng rời nhau nhất / bắn ít mũi tên nhất: sắp theo cuối (bài 452).
