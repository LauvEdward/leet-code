---
id: 112
title: Path Sum
slug: path-sum
difficulty: Easy
topics: Binary Tree General, DFS
date: 2026-10-20
time: O(n)
space: O(h)
status: Chưa nộp (LeetCode trong Chrome chưa đăng nhập)
---
## Đề bài
Kiểm tra cây có đường đi **từ gốc tới một lá** mà tổng giá trị các nút bằng `targetSum` hay không.

## Cơ sở lý thuyết
- **Truyền phần còn lại xuống dưới**: đi qua nút có giá trị `v` thì bài toán cho cây con trở thành "tìm đường có tổng `targetSum - v`".
- **Lá** là nút không có con nào. Điều kiện kết thúc phải kiểm tra ở lá, không phải ở `nil` — nếu không, nút chỉ có một con sẽ bị coi nhầm là điểm kết thúc của đường đi.
- Giá trị có thể âm nên không thể cắt tỉa sớm khi tổng vượt mục tiêu.

## Hướng xử lý
1. Cây rỗng → `false`.
2. `rest = targetSum - giá trị nút`.
3. Nút là lá → `rest == 0`.
4. Ngược lại → thử cây con trái hoặc cây con phải với `rest`.

## Ý tưởng triển khai
- Cây rỗng trả `false` (kể cả khi `targetSum = 0`) — đúng yêu cầu đề vì không có đường đi nào.
- `||` ngắn mạch: tìm thấy ở nhánh trái thì không duyệt nhánh phải.
- Test cục bộ: liệt kê tổng của mọi đường gốc → lá và so.

## Ví dụ chạy từng bước
**Input:** `root = [5, 4, 8, 11, null, 13, 4, 7, 2, null, null, null, 1]`, `targetSum = 22`
**Output:** `true`

```
5:  rest = 22 - 5  = 17
 4: rest = 17 - 4  = 13
  11: rest = 13 - 11 = 2
   7 (lá): rest = 2 - 7 = -5 ≠ 0 ✗
   2 (lá): rest = 2 - 2 = 0  ✓ → true (dừng, không xét nhánh 8)
Đường đi: 5 → 4 → 11 → 2
```

**Input:** `root = [1, 2]`, `targetSum = 1`
**Output:** `false`

```
1: rest = 0, nhưng nút 1 có con trái nên không phải lá
 2 (lá): rest = 0 - 2 = -2 ✗
 con phải nil → false
```

## Ghi nhớ
Bài đường đi gốc → lá: truyền "phần còn lại" xuống và chỉ chốt kết quả ở **lá**. Bài 113 trả về luôn các đường đi (thêm mảng đường hiện tại và quay lui).
