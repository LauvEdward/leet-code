---
id: 289
title: Game of Life
slug: game-of-life
difficulty: Medium
topics: Matrix, Simulation
date: 2026-10-18
time: O(m · n)
space: O(m · n) (bản sao bảng)
status: Chưa nộp (LeetCode trong Chrome chưa đăng nhập)
---
## Đề bài
Bảng `m × n` gồm ô sống (`1`) và chết (`0`). Tính trạng thái thế hệ kế tiếp theo luật Conway, áp dụng **đồng thời** cho mọi ô: ô sống có ít hơn 2 hoặc nhiều hơn 3 hàng xóm sống thì chết; có 2 hoặc 3 thì sống tiếp; ô chết có đúng 3 hàng xóm sống thì sống lại.

## Cơ sở lý thuyết
- **Ô tự động tế bào (cellular automaton)**: trạng thái mới của mỗi ô chỉ phụ thuộc trạng thái **cũ** của 8 ô xung quanh (lân cận Moore).
- "Đồng thời" nghĩa là mọi ô phải đọc từ cùng một thế hệ cũ. Nếu sửa ô ngay khi tính, các ô tính sau sẽ đọc nhầm giá trị mới.
- Hai cách giữ trạng thái cũ: **chép bảng** (đơn giản, dùng ở đây) hoặc **mã hóa hai trạng thái vào một ô** (ví dụ `2` = sống → chết, `3` = chết → sống, đọc trạng thái cũ bằng `% 2`) để đạt `O(1)` bộ nhớ như câu hỏi thêm của đề.

## Hướng xử lý
1. Chép `old = board`.
2. Với mỗi ô, đếm số hàng xóm sống trong `old` (8 hướng, bỏ chính nó, bỏ ô ngoài biên).
3. Áp luật để ghi trạng thái mới vào `board`.

## Ý tưởng triển khai
- `let old = board` — mảng Swift là kiểu giá trị nên đây là một bản sao độc lập (copy-on-write).
- Hai vòng `di`, `dj` trong `-1...1` với `where di != 0 || dj != 0`.
- Luật gọn: sống tiếp nếu `live == 2 || live == 3`; sống lại nếu `live == 3`.
- Test cục bộ: ví dụ của đề, mẫu "blinker" dao động chu kỳ 2 và mẫu "block" đứng yên.

## Ví dụ chạy từng bước
**Input:** `board = [[0, 1, 0], [0, 0, 1], [1, 1, 1], [0, 0, 0]]`
**Output:** `[[0, 0, 0], [1, 0, 1], [0, 1, 1], [0, 1, 0]]`

Các ô có thay đổi hoặc đáng chú ý:

```
(0,1) sống: hàng xóm sống = (1,2) → 1          → chết
(1,0) chết: hàng xóm sống = (0,1), (2,0), (2,1) → 3 → sống lại
(1,1) chết: hàng xóm sống = (0,1), (1,2), (2,0), (2,1), (2,2) → 5 → vẫn chết
(1,2) sống: hàng xóm sống = (0,1), (2,1), (2,2) → 3 → sống tiếp
(2,0) sống: hàng xóm sống = (2,1) → 1          → chết
(2,1) sống: hàng xóm sống = (1,2), (2,0), (2,2) → 3 → sống tiếp
(2,2) sống: hàng xóm sống = (1,2), (2,1) → 2    → sống tiếp
(3,1) chết: hàng xóm sống = (2,0), (2,1), (2,2) → 3 → sống lại
```

Mọi phép đếm đều đọc từ `old`: ví dụ ô `(1,1)` vẫn thấy `(2,0)` còn sống, dù `(2,0)` sẽ chết ở thế hệ mới.

**Input:** `board = [[1, 1], [1, 0]]` → **Output:** `[[1, 1], [1, 1]]` (ô `(1,1)` có đúng 3 hàng xóm sống nên sống lại).

## Ghi nhớ
Cập nhật "đồng thời" trên lưới → đọc từ bản cũ, ghi vào bản mới. Khi bị yêu cầu tại chỗ, mã hóa trạng thái cũ và mới vào cùng một ô.
