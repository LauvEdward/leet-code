---
id: 124
title: Binary Tree Maximum Path Sum
slug: binary-tree-maximum-path-sum
difficulty: Hard
topics: Binary Tree General, Dynamic Programming, DFS
date: 2026-10-20
time: O(n)
space: O(h)
status: Chưa nộp (LeetCode trong Chrome chưa đăng nhập)
---
## Đề bài
Một *đường đi* trong cây là dãy nút nối nhau bằng cạnh, mỗi nút xuất hiện tối đa một lần, không cần đi qua gốc. Tìm tổng giá trị lớn nhất của một đường đi khác rỗng. Giá trị nút có thể âm.

## Cơ sở lý thuyết
- Mỗi đường đi có đúng một nút **cao nhất** (gần gốc nhất) — nơi đường đi "gập" lại. Tại nút đó, đường đi gồm: một nhánh đi xuống bên trái (có thể rỗng) + chính nút + một nhánh đi xuống bên phải (có thể rỗng).
- **DP trên cây với hai đại lượng khác nhau**:
   - Giá trị **trả lên cho cha** (`gain`): tổng lớn nhất của đường đi **xuống** bắt đầu tại nút — chỉ được chọn **một** nhánh, vì cha sẽ nối thêm vào.
   - Giá trị **cập nhật đáp án**: đường đi gập tại nút, được dùng **cả hai** nhánh.
- Nhánh có tổng âm thì bỏ (coi như 0) — thêm vào chỉ làm giảm tổng.

## Hướng xử lý
1. `gain(nil) = 0`.
2. Tại nút `n`: `l = max(0, gain(trái))`, `r = max(0, gain(phải))`.
3. Cập nhật `best = max(best, n.val + l + r)`.
4. Trả về `n.val + max(l, r)`.

## Ý tưởng triển khai
- `best` là thuộc tính của lớp, khởi tạo `Int.min` (đáp án có thể âm khi mọi nút đều âm); đặt lại mỗi lần gọi `maxPathSum`.
- Cập nhật `best` với `n.val + l + r` **luôn** gồm chính nút `n`, nên đường đi không bao giờ rỗng.
- Test cục bộ: vét cạn mọi cặp nút làm hai đầu đường đi (qua tổ tiên chung thấp nhất) trên 1500 cây ngẫu nhiên có giá trị âm.

## Ví dụ chạy từng bước
**Input:** `root = [-10, 9, 20, null, null, 15, 7]`
**Output:** `42`

```
       -10
       /  \
      9    20
          /  \
         15   7

gain(9):   l = 0, r = 0 → best = max(-∞, 9) = 9           trả 9
gain(15):  best = max(9, 15) = 15                          trả 15
gain(7):   best = 15                                       trả 7
gain(20):  l = 15, r = 7 → gập tại 20: 20 + 15 + 7 = 42 → best = 42
           trả 20 + max(15, 7) = 35
gain(-10): l = 9, r = 35 → gập tại -10: -10 + 9 + 35 = 34 < 42
           trả -10 + 35 = 25
Đáp án: 42   (đường 15 → 20 → 7, không đi qua gốc)
```

**Input:** `root = [2, -1]` → **Output:** `2`

```
gain(-1): best = -1, trả -1
gain(2):  l = max(0, -1) = 0 (bỏ nhánh âm) → best = max(-1, 2 + 0 + 0) = 2
```

## Ghi nhớ
Bài "đường đi bất kỳ trên cây" → mỗi nút trả lên **một nhánh** nhưng cập nhật đáp án toàn cục với **hai nhánh**. Cùng khuôn với đường kính cây (bài 543).
