---
id: 530
title: Minimum Absolute Difference in BST
slug: minimum-absolute-difference-in-bst
difficulty: Easy
topics: Binary Search Tree, DFS
date: 2026-10-21
time: O(n)
space: O(h)
status: Chưa nộp (LeetCode trong Chrome chưa đăng nhập)
---
## Đề bài
Tìm hiệu tuyệt đối nhỏ nhất giữa giá trị của hai nút khác nhau bất kỳ trong cây nhị phân tìm kiếm.

## Cơ sở lý thuyết
- **Duyệt trung thứ tự BST cho dãy tăng dần.**
- Trong một dãy đã sắp, hiệu nhỏ nhất giữa hai phần tử bất kỳ luôn đạt được ở **hai phần tử liền kề** (nếu `a < b < c` thì `c - a > b - a`). Nên chỉ cần so mỗi nút với nút đứng trước nó trong thứ tự trung thứ tự.

## Hướng xử lý
1. Duyệt trung thứ tự, giữ `prev` = giá trị vừa thăm.
2. Tại mỗi nút: nếu đã có `prev` thì cập nhật `best = min(best, val - prev)`; rồi `prev = val`.

## Ý tưởng triển khai
- `prev: Int?` (`nil` khi chưa thăm nút nào) và `best` là thuộc tính của lớp; đặt lại ở đầu mỗi lần gọi.
- Không cần `abs` vì dãy tăng nên `val - prev > 0`.
- Test cục bộ: dựng BST ngẫu nhiên, so với hiệu nhỏ nhất của các cặp liền kề trong mảng đã sắp.

## Ví dụ chạy từng bước
**Input:** `root = [4, 2, 6, 1, 3]`
**Output:** `1`

```
Trung thứ tự: 1, 2, 3, 4, 6
thăm 1: prev = nil → chỉ ghi prev = 1
thăm 2: 2 - 1 = 1 → best = 1, prev = 2
thăm 3: 3 - 2 = 1 → best = 1, prev = 3
thăm 4: 4 - 3 = 1 → best = 1, prev = 4
thăm 6: 6 - 4 = 2 → best = 1
```

**Input:** `root = [1, 0, 48, null, null, 12, 49]` → **Output:** `1`

```
Trung thứ tự: 0, 1, 12, 48, 49 → các hiệu 1, 11, 36, 1 → nhỏ nhất 1
```

## Ghi nhớ
Bài BST về thứ tự (hiệu nhỏ nhất, phần tử thứ `k`, kiểm tra hợp lệ…) → duyệt trung thứ tự để có dãy tăng.
