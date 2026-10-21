---
id: 98
title: Validate Binary Search Tree
slug: validate-binary-search-tree
difficulty: Medium
topics: Binary Search Tree, DFS
date: 2026-10-21
time: O(n)
space: O(h)
status: Chưa nộp (LeetCode trong Chrome chưa đăng nhập)
---
## Đề bài
Kiểm tra cây nhị phân có phải cây tìm kiếm hợp lệ không: mọi nút trong cây con trái **nhỏ hơn hẳn** nút, mọi nút trong cây con phải **lớn hơn hẳn** nút, và hai cây con cũng là BST.

## Cơ sở lý thuyết
- **Cạm bẫy**: chỉ so nút với hai con trực tiếp là **không đủ**. Ràng buộc áp lên **toàn bộ** cây con: một nút sâu bên phải của cây con trái vẫn phải nhỏ hơn tổ tiên.
- **Truyền khoảng hợp lệ xuống**: mỗi nút phải nằm chặt trong khoảng `(lo, hi)`. Đi sang trái thì cận trên thành giá trị nút; đi sang phải thì cận dưới thành giá trị nút.
- Cách tương đương: duyệt trung thứ tự và kiểm tra dãy tăng nghiêm ngặt (dùng trong test cục bộ).

## Hướng xử lý
1. `check(root, -∞, +∞)`.
2. `check(n, lo, hi)`: nút rỗng → đúng; `n.val ≤ lo` hoặc `n.val ≥ hi` → sai; ngược lại `check(trái, lo, n.val) && check(phải, n.val, hi)`.

## Ý tưởng triển khai
- Dùng `Int.min`, `Int.max` (64 bit) làm vô cùng: giá trị nút chỉ trong khoảng 32 bit nên không bao giờ chạm tới hai cận này. Nếu dùng `Int32.min` sẽ sai với nút có giá trị đúng bằng `-2³¹`.
- So sánh **chặt** (`<=`, `>=` cho trường hợp sai) vì BST không cho phép giá trị bằng nhau.

## Ví dụ chạy từng bước
**Input:** `root = [5, 4, 6, null, null, 3, 7]`
**Output:** `false`

```
      5
     / \
    4   6
       / \
      3   7

check(5, -∞, +∞): ok
   check(4, -∞, 5): ok, hai con rỗng
   check(6, 5, +∞): ok
      check(3, 5, 6): 3 <= 5 → false
(3 nhỏ hơn cha 6 nên cách so với con trực tiếp sẽ bỏ sót,
 nhưng 3 nằm trong cây con phải của 5 nên phải > 5)
```

**Input:** `root = [2, 1, 3]` → **Output:** `true`

```
check(2, -∞, +∞) → check(1, -∞, 2) ✓ · check(3, 2, +∞) ✓
```

## Ghi nhớ
Ràng buộc "mọi phần tử trong cây con" → truyền khoảng `(lo, hi)` xuống, không chỉ so với con trực tiếp. Chọn giá trị vô cùng nằm ngoài miền dữ liệu.
