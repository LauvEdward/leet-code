---
id: 36
title: Valid Sudoku
slug: valid-sudoku
difficulty: Medium
topics: Matrix, Hash Table
date: 2026-10-18
time: O(81) = O(1)
space: O(81) = O(1)
status: Chưa nộp (LeetCode trong Chrome chưa đăng nhập)
---
## Đề bài
Kiểm tra một bảng Sudoku 9×9 (đang điền dở, ô trống là `.`) có hợp lệ không: mỗi hàng, mỗi cột và mỗi ô vuông 3×3 không được có chữ số lặp lại. Không cần kiểm tra bảng có giải được hay không.

## Cơ sở lý thuyết
- **Kiểm tra trùng lặp bằng tập hợp**: `Set.insert` trả về `inserted = false` khi phần tử đã có — vừa thêm vừa phát hiện trùng trong một bước.
- **Đánh số ô 3×3**: ô `(i, j)` thuộc khối `(i / 3) * 3 + j / 3` (từ 0 đến 8, đi theo hàng). Phép chia nguyên gom 3 hàng và 3 cột liền nhau vào cùng một khối.
- Mỗi ô tham gia đúng ba ràng buộc (hàng, cột, khối), nên chỉ cần duyệt bảng **một lần** và cập nhật ba tập.

## Hướng xử lý
1. 9 tập cho hàng, 9 tập cho cột, 9 tập cho khối.
2. Duyệt từng ô có chữ số; thêm vào ba tập tương ứng.
3. Lần thêm nào thất bại (đã có) → `false`. Duyệt hết → `true`.

## Ý tưởng triển khai
- `[Set<Character>](repeating: [], count: 9)` cho mỗi loại.
- Gộp ba lần `insert` trong một biểu thức `||`: Swift đánh giá ngắn mạch, nhưng khi đã trả `false` thì không cần quan tâm các tập còn lại.
- Kích thước cố định 9×9 nên mọi độ phức tạp đều là hằng số.

## Ví dụ chạy từng bước
**Input:** bảng của đề với ô `(0, 0)` đổi thành `8`:

```
8 3 . | . 7 . | . . .
6 . . | 1 9 5 | . . .
. 9 8 | . . . | . 6 .
------+-------+------
8 . . | . 6 . | . . 3
...
```

**Output:** `false`

```
(0,0) '8': rows[0]={8}, cols[0]={8}, boxes[0]={8}
(0,1) '3': rows[0]={8,3}, cols[1]={3}, boxes[0]={8,3}
(0,4) '7': rows[0], cols[4], boxes[1] đều thêm được
(1,0) '6', (1,3) '1', (1,4) '9', (1,5) '5': thêm được
(2,1) '9': rows[2]={9}, cols[1]={3,9}, boxes[0]={8,3,6,9}
(2,2) '8': rows[2] thêm được, cols[2] thêm được,
           boxes[(2/3)*3 + 2/3 = 0] đã có 8 → insert thất bại → false
```

Lỗi bị phát hiện ở ô 3×3 đầu tiên trước cả khi tới hàng 3 (nơi cột 0 cũng có hai số 8).

**Input:** bảng trống chỉ có hai số `5` ở `(0, 0)` và `(4, 4)` → **Output:** `true` (khác hàng, khác cột, khác khối).

## Ghi nhớ
Kiểm tra ràng buộc "không trùng" trên nhiều nhóm chồng nhau → mỗi nhóm một tập, duyệt một lần. Công thức chỉ số khối `(i / 3) * 3 + j / 3` dùng lại trong bài giải Sudoku (37).
