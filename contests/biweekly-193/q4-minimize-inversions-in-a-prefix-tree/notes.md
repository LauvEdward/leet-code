---
id: 193004
title: Minimize Inversions in a Prefix Tree
slug: minimize-inversions-in-a-prefix-tree
difficulty: Hard
topics: Biweekly Contest 193, Trie, Bitmask DP, Divide and Conquer, DFS
date: 2026-10-11
time: O(n · độ sâu · log n + Σ 2^m · m) với m ≤ 10 là số con của một nút
space: O(số nút của cây + 2^m · m)
status: Chưa nộp (bài chưa mở ngoài trang contest)
---
## Đề bài
Cho `n ≤ 10⁴` từ khác nhau (chỉ gồm chữ `a…j`, dài tối đa 20) và hoán vị `target`. Dựng cây tiền tố (trie); nút ứng với từ `words[i]` được đánh dấu `i`. Được tự chọn thứ tự các con của mỗi nút. Duyệt tiền thứ tự (ghi nút trước, rồi tới các con) cho ra một dãy chỉ số; đếm số nghịch thế của dãy đó theo vị trí trong `target`. Tìm số nghịch thế nhỏ nhất.

## Cơ sở lý thuyết
- **Trie (cây tiền tố)**: mỗi nút là một tiền tố, cạnh là một ký tự. Bảng chữ cái chỉ có 10 chữ → mỗi nút tối đa **10 con**.
- **Nghịch thế (inversion)**: cặp vị trí `a < b` mà giá trị ở `a` lớn hơn ở `b`.
- **Phân rã nghịch thế theo cây**: trong duyệt tiền thứ tự, mỗi cây con chiếm một **đoạn liên tiếp**. Một cặp phần tử bất kỳ thuộc đúng một trong ba loại, và ba loại này **độc lập** với nhau:
   1. Nút tổ tiên và nút con cháu: tổ tiên luôn đứng trước → số nghịch thế **cố định**, không phụ thuộc lựa chọn nào.
   2. Hai nút ở hai nhánh con khác nhau của cùng một nút `u`: chỉ phụ thuộc **thứ tự các con của `u`**.
   3. Hai nút trong cùng một nhánh con: thuộc bài toán con, giải đệ quy.
- **Bitmask DP trên hoán vị**: tìm thứ tự tốt nhất của `m` phần tử khi chi phí là tổng trên các cặp (i đứng trước j tốn `inv[i][j]`). `dp[mask]` = chi phí nhỏ nhất khi tập `mask` được xếp ở đầu. `O(2^m · m)` thay cho `m!`.
- Không dùng tham lam "so từng cặp nhánh" được: quan hệ "nên đứng trước" giữa các nhánh có thể tạo vòng (A trước B, B trước C, C trước A), nên phải DP.

## Hướng xử lý
1. Đổi `target` thành `pos[i]` = vị trí của chỉ số `i`. Từ đây mỗi từ chỉ là một con số `pos`, và ta đếm nghịch thế trên các số đó.
2. Dựng trie, lưu `pos` của từ tại nút kết thúc.
3. DFS hậu thứ tự, mỗi nút trả về danh sách `pos` **đã sắp xếp** của cả cây con.
4. Tại nút `u` có `m ≥ 2` nhánh con:
   - Với mỗi cặp nhánh `(i, j)`, đếm `inv[i][j]` = số cặp `(x ∈ i, y ∈ j)` có `x > y` bằng hai con trỏ trên hai danh sách đã sắp. Chiều ngược lại là `|i|·|j| - inv[i][j]` (các `pos` đôi một khác nhau).
   - Chạy bitmask DP để tìm thứ tự các nhánh có tổng nhỏ nhất, cộng vào đáp án.
5. Nếu `u` là một từ: nó đứng trước toàn bộ cây con, nên cộng số phần tử trong cây con có `pos` nhỏ hơn `pos` của `u` (loại 1).
6. Tổng của mọi nút là đáp án.

## Ý tưởng triển khai
- Trie bằng mảng: `kids[u]` là mảng 10 ô (`-1` nếu không có con), `mark[u]` là `pos` hoặc `-1`. Không cần class nút.
- `cross(a, b)`: duyệt `x` trong `a` tăng dần, con trỏ `j` trong `b` chỉ tiến; `j` chính là số phần tử của `b` nhỏ hơn `x`.
- Tăng tốc DP: `w[c][mask]` = tổng `inv[i][c]` với `i ∈ mask`, tính dần nhờ bit thấp nhất: `w[c][mask] = w[c][mask bỏ bit thấp nhất] + inv[bit thấp nhất][c]`. Khi đó `dp[mask] = min(dp[mask bỏ c] + w[c][mask bỏ c])`.
- Gộp danh sách con bằng `flatMap` rồi `sorted()` cho đơn giản; mỗi từ nằm trong tối đa 20 danh sách (độ sâu ≤ 20) nên tổng chi phí vẫn nhỏ.
- Đệ quy sâu tối đa 20, không lo tràn ngăn xếp.
- Test cục bộ: vét cạn sinh **mọi** thứ tự duyệt có thể của cây trên 1500 bộ từ ngẫu nhiên nhỏ; và chạy thử cây 10 nhánh đầy đủ sâu 4 (`10⁴` từ).

## Ví dụ chạy từng bước
**Input:** `words = ["bad", "bag", "fig", "fed"]`, `target = [3, 1, 0, 2]`
**Output:** `2`

Đổi sang vị trí: `pos[3] = 0`, `pos[1] = 1`, `pos[0] = 2`, `pos[2] = 3`, tức:

```
"bad" → 2     "bag" → 1     "fig" → 3     "fed" → 0
```

Cây tiền tố:

```
(gốc)
├── b ── a ──┬── d   "bad" (2)
│            └── g   "bag" (1)
└── f ──┬── i ── g   "fig" (3)
        └── e ── d   "fed" (0)
```

DFS từ dưới lên:

```
Nút "ba": 2 nhánh  d = [2],  g = [1]
   d trước g: cặp (2, 1) có 2 > 1 → 1 nghịch thế
   g trước d: 1·1 - 1             → 0 nghịch thế   ← chọn
   cộng 0, trả về [1, 2]
Nút "b":  1 nhánh → không có gì để chọn, trả về [1, 2]

Nút "f":  2 nhánh  e = [0],  i = [3]
   e trước i: cặp (0, 3) → 0 nghịch thế            ← chọn
   i trước e: 1
   cộng 0, trả về [0, 3]

Nút gốc:  2 nhánh  b = [1, 2],  f = [0, 3]
   b trước f: các cặp x ∈ b, y ∈ f có x > y: (1, 0), (2, 0) → 2
   f trước b: 2·2 - 2 = 2   (các cặp (3, 1), (3, 2))
   dp chọn min = 2 → cộng 2

Tổng: 0 + 0 + 2 = 2
```

Một thứ tự duyệt đạt được kết quả này: `fed, fig, bag, bad` → dãy vị trí `[0, 3, 1, 2]`, có đúng 2 nghịch thế `(3, 1)` và `(3, 2)`.

**Input:** `words = ["a", "ab", "abc"]`, `target = [2, 1, 0]` → **Output:** `3`

```
pos: "a" → 2, "ab" → 1, "abc" → 0. Cây là một đường thẳng, không có gì để chọn.
Nút "ab": cây con [0], pos của nó là 1 → có 1 phần tử nhỏ hơn → cộng 1
Nút "a":  cây con [0, 1], pos của nó là 2 → có 2 phần tử nhỏ hơn → cộng 2
Tổng: 3   (dãy duyệt bắt buộc là [2, 1, 0])
```

## Ghi nhớ
Bài tối ưu trên cây với lựa chọn tại từng nút: tìm cách **tách hàm mục tiêu thành tổng các phần chỉ phụ thuộc một nút**, khi đó mỗi nút tối ưu độc lập. Ràng buộc nhỏ lạ thường (bảng chữ cái chỉ `a…j` → tối đa 10 con) là lời gợi ý cho `2^10` — bitmask DP.
