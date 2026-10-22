---
id: 909
title: Snakes and Ladders
slug: snakes-and-ladders
difficulty: Medium
topics: Graph BFS, Matrix
date: 2026-10-22
time: O(n²)
space: O(n²)
status: Chưa nộp (LeetCode trong Chrome chưa đăng nhập)
---
## Đề bài
Bàn cờ `n × n` đánh số `1…n²` theo kiểu zigzag từ hàng dưới cùng (hàng dưới trái → phải, hàng trên kế tiếp phải → trái…). Mỗi lượt gieo xúc xắc đi tới một ô trong `cur + 1 … cur + 6`; nếu ô đó có thang hoặc rắn (`board[r][c] != -1`) thì bắt buộc đi tới ô đích của nó. Tìm số lượt ít nhất để từ ô 1 tới ô `n²`, không tới được thì `-1`.

## Cơ sở lý thuyết
- **BFS cho đường đi ngắn nhất trên đồ thị không trọng số**: mỗi lượt là một cạnh có độ dài 1, nên lần đầu BFS chạm tới một đỉnh chính là số lượt ít nhất.
- Đỉnh là số ô `1…n²`; từ ô `s` có tối đa 6 cạnh, mỗi cạnh dẫn tới ô `s + k` hoặc đích của thang/rắn ở đó.
- **Chuyển số ô sang tọa độ**: với `q = (s - 1) / n`, `r = (s - 1) % n`: hàng là `n - 1 - q`; cột là `r` khi `q` chẵn, `n - 1 - r` khi `q` lẻ. Đây là chỗ dễ sai nhất của bài.
- Chỉ đi theo thang/rắn **một lần** mỗi lượt (không đi tiếp nếu đích lại là đầu một thang khác).

## Hướng xử lý
1. `dist[1] = 0`, hàng đợi bắt đầu từ ô 1.
2. Lấy ô `s`; nếu là `n²` thì trả `dist[s]`.
3. Với mỗi `nx` trong `s + 1 … min(s + 6, n²)`: tính ô đích `dest` (theo thang/rắn nếu có); nếu chưa thăm thì `dist[dest] = dist[s] + 1` và đưa vào hàng đợi.
4. Hết hàng đợi → `-1`.

## Ý tưởng triển khai
- Hàng đợi là mảng cộng chỉ số đầu `h` (thay cho `removeFirst`).
- `dist = -1` vừa là "chưa thăm" vừa lưu khoảng cách.
- Đánh dấu ô **đích** (sau thang/rắn), không phải ô vừa gieo tới.
- Test cục bộ: hai ví dụ của đề, bảng trống, và bảng bị chặn (mọi ô 2…7 là rắn về 1).

## Ví dụ chạy từng bước
**Input:** bảng 6 × 6 của đề — ô 2 có thang tới 15, ô 14 có thang tới 35, ô 17 có rắn về 13
**Output:** `4`

```
Lượt 0: {1}
Lượt 1: gieo từ 1 → ô 2 (thang → 15), 3, 4, 5, 6, 7
Lượt 2: từ 15 → 16, 17 (rắn → 13), 18, 19, 20, 21
        từ 3…7 → 8…13 (13 đã có)
Lượt 3: từ 8…13 → ô 14 (thang → 35), …
Lượt 4: từ 35 → 36 = n² → trả về 4
```

Đường đi tương ứng: `1 → 2 (lên 15) → 17 (xuống 13) → 14 (lên 35) → 36`.

**Input:** `board = [[-1, -1], [-1, 3]]` → **Output:** `1` (từ ô 1 gieo thẳng tới ô 4 = `n²`).

## Ghi nhớ
"Ít bước nhất, mỗi bước như nhau" → BFS. Phần khó thường là mô hình hóa đỉnh và cạnh (ở đây: đổi số ô zigzag sang tọa độ), không phải bản thân BFS.
