---
id: 129
title: Sum Root to Leaf Numbers
slug: sum-root-to-leaf-numbers
difficulty: Medium
topics: Binary Tree General, DFS
date: 2026-10-20
time: O(n)
space: O(h)
status: Chưa nộp (LeetCode trong Chrome chưa đăng nhập)
---
## Đề bài
Mỗi nút chứa một chữ số 0–9. Mỗi đường đi từ gốc tới lá tạo thành một số (đọc các chữ số theo thứ tự). Tính tổng tất cả các số đó.

## Cơ sở lý thuyết
- **Truyền giá trị tích lũy xuống**: đi từ nút cha có số tạm `cur` xuống nút con có chữ số `d` thì số tạm mới là `cur × 10 + d` (sơ đồ Horner, như đọc số từ trái sang phải).
- Kết quả cho một cây con = tổng các số kết thúc ở những lá trong cây con đó → cộng kết quả hai nhánh.

## Hướng xử lý
1. `dfs(node, cur)`: nút rỗng → `0`.
2. `v = cur * 10 + node.val`.
3. Nút là lá → trả `v`.
4. Ngược lại → `dfs(trái, v) + dfs(phải, v)`.

## Ý tưởng triển khai
- Nhánh `nil` trả `0`, nên nút chỉ có một con vẫn cộng đúng (nhánh rỗng không đóng góp số nào).
- Độ sâu tối đa 10 theo đề nên số không tràn `Int`.
- Test cục bộ: ghép chuỗi chữ số của mọi đường gốc → lá, đổi ra số rồi cộng.

## Ví dụ chạy từng bước
**Input:** `root = [4, 9, 0, 5, 1]`
**Output:** `1026`

```
      4
     / \
    9   0
   / \
  5   1

dfs(4, 0):  v = 4
  dfs(9, 4):  v = 49
    dfs(5, 49): v = 495 → lá → 495
    dfs(1, 49): v = 491 → lá → 491
    → 495 + 491 = 986
  dfs(0, 4):  v = 40 → lá → 40
  → 986 + 40 = 1026
```

**Input:** `root = [1, 2, 3]` → **Output:** `25` (`12 + 13`).

## Ghi nhớ
Thông tin phụ thuộc vào **đường đi từ gốc** (tổng, số tạo thành, tập đã thấy) → truyền xuống qua tham số. Thông tin phụ thuộc vào **cây con** (chiều cao, tổng cây) → trả lên qua giá trị trả về. Bài 124 cần cả hai chiều.
