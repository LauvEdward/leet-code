---
id: 4081
title: Prime Subset Selection II
slug: prime-subset-selection-ii
difficulty: Hard
topics: Weekly Contest 523, Dynamic Programming, Knapsack, Number Theory, Greedy
date: 2026-10-11
time: O(π(n) · s)
space: O(π(n) · s)
status: Accepted
---
## Đề bài
Cho `n, s ≤ 1000`. Chọn một tập con các số nguyên tố `≤ n` (mỗi số một lần) sao cho: (1) tổng lớn nhất có thể mà không vượt `s`; (2) trong các tập đạt tổng đó, ít phần tử nhất; (3) nếu vẫn hòa, mảng tăng dần nhỏ nhất theo thứ tự từ điển. Trả về mảng đó (rỗng nếu không chọn được gì).

## Cơ sở lý thuyết
- **Knapsack 0/1 theo tổng**: trạng thái là "tổng đúng bằng `t`", giá trị là thứ cần tối ưu (ở đây: **số phần tử ít nhất**). Với khoảng 168 số nguyên tố `≤ 1000` và `s ≤ 1000`, bảng chỉ có cỡ `1.7 × 10⁵` ô.
- **Tối ưu nhiều tiêu chí theo thứ tự ưu tiên**: xử lý lần lượt — tiêu chí 1 chọn tổng `T`, tiêu chí 2 là giá trị DP tại `T`, tiêu chí 3 giải ở bước **truy vết**.
- **Dựng lời giải nhỏ nhất theo từ điển**: đi từ trái sang phải, ở mỗi vị trí chọn giá trị **nhỏ nhất** mà phần còn lại vẫn hoàn thành được. Muốn kiểm tra "phần còn lại hoàn thành được" trong `O(1)` thì DP phải được định nghĩa trên **hậu tố** (`ps[i...]`), không phải tiền tố.

## Hướng xử lý
1. Liệt kê các số nguyên tố `≤ n` thành `ps` (tăng dần).
2. `g[i][t]` = số phần tử ít nhất chọn từ `ps[i...]` để có tổng đúng `t` (`∞` nếu không được). Với mỗi `i`: hoặc bỏ `ps[i]` (`g[i+1][t]`), hoặc lấy (`g[i+1][t - ps[i]] + 1`).
3. Tiêu chí 1: `T` = giá trị `t` lớn nhất `≤ s` có `g[0][t]` hữu hạn. Nếu `T = 0` thì trả mảng rỗng.
4. Tiêu chí 2: số phần tử `k = g[0][T]`.
5. Tiêu chí 3 — truy vết: đang ở chỉ số `i`, còn cần tổng `t` với `k` phần tử. Duyệt `j` từ `i` lên, chọn `ps[j]` **đầu tiên** thỏa `g[j+1][t - ps[j]] == k - 1`; cập nhật `t`, `k`, `i = j + 1`. Lặp tới khi `k = 0`.

## Ý tưởng triển khai
- Tìm số nguyên tố bằng cách thử chia cho các số nguyên tố đã có (`ps.allSatisfy`) — `n ≤ 1000` nên không cần sàng.
- `INF = Int.max / 2` để `+ 1` không tràn; điều kiện tìm `T` là `g[0][t] >= INF`.
- Vòng tìm `T` dừng ở `t = 0`, nơi `g[0][0] = 0` → `k = 0` → vòng truy vết không chạy → mảng rỗng. Không cần nhánh riêng cho "không chọn được gì".
- Trong truy vết luôn tìm được `j` (vì `g[i][t] == k` đảm bảo tồn tại cách chọn), nên vòng `while` chắc chắn kết thúc.
- Test cục bộ: vét cạn mọi tập con với `n ≤ 47` (15 số nguyên tố), so sánh đúng theo ba tiêu chí của đề.

## Ví dụ chạy từng bước
**Input:** `n = 15`, `s = 18`
**Output:** `[5, 13]`

```
ps = [2, 3, 5, 7, 11, 13]   (chỉ số 0..5)

Tiêu chí 1: g[0][18] hữu hạn → T = 18
Tiêu chí 2: g[0][18] = 2     (các tập 2 phần tử có tổng 18: {5, 13}, {7, 11})

Truy vết với i=0, t=18, k=2:
   j=0 (2):  cần g[1][16] == 1 → 16 không phải một số nguyên tố trong [3..13] → g = 2 ✗
   j=1 (3):  cần g[2][15] == 1 → 15 không tạo được từ [5, 7, 11, 13]           → ∞ ✗
   j=2 (5):  cần g[3][13] == 1 → 13 có trong [7, 11, 13]                       → 1 ✓
   → chọn 5,  t = 13, k = 1, i = 3

Truy vết với i=3, t=13, k=1:
   j=3 (7):  cần g[4][6] == 0  → ∞ ✗
   j=4 (11): cần g[5][2] == 0  → ∞ ✗
   j=5 (13): cần g[6][0] == 0  → 0 ✓
   → chọn 13, t = 0, k = 0 → dừng

Kết quả: [5, 13]
```

**Input:** `n = 7`, `s = 20` → **Output:** `[2, 3, 5, 7]`

```
ps = [2, 3, 5, 7], tổng tất cả là 17 <= 20
t = 20, 19, 18: không tạo được · t = 17: g[0][17] = 4 → T = 17, k = 4
Truy vết lấy lần lượt 2, 3, 5, 7
```

**Input:** `n = 5`, `s = 1` → **Output:** `[]` (`t` giảm về `0`, `k = g[0][0] = 0`).

## Ghi nhớ
Yêu cầu "nhỏ nhất theo từ điển" trên lời giải của một bài DP → định nghĩa DP theo **hậu tố** rồi truy vết tham lam từ trái sang. So với bản I: đổi mục tiêu từ "nhiều phần tử nhất" sang "tổng lớn nhất" là từ tham lam nhảy sang knapsack — đọc kỹ mục tiêu trước khi chọn kỹ thuật.
