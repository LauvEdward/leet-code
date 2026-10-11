---
id: 134
title: Gas Station
slug: gas-station
difficulty: Medium
topics: Array / String, Greedy
date: 2026-10-11
time: O(n)
space: O(1)
status: Accepted
---
## Đề bài
Có `n` trạm xăng trên một vòng tròn; trạm `i` cho `gas[i]` xăng, đi tới trạm kế tốn `cost[i]`. Bắt đầu với bình rỗng, tìm trạm xuất phát để đi hết một vòng (đáp án duy nhất nếu có), không được thì trả `-1`.

## Cơ sở lý thuyết
- Đặt `d[i] = gas[i] - cost[i]` (lãi/lỗ khi qua trạm `i`).
- **Điều kiện tồn tại**: đi được hết vòng ⟺ `tổng d ≥ 0`. Chiều thuận hiển nhiên; chiều ngược là một định lý quen thuộc — nếu tổng không âm thì xuất phát ngay sau điểm mà tổng tiền tố **thấp nhất** sẽ không bao giờ cạn xăng.
- **Bổ đề loại bỏ**: nếu xuất phát từ `s` mà cạn xăng lần đầu tại `i`, thì **mọi trạm từ `s` tới `i`** cũng không thể là điểm xuất phát. Lý do: khi đi từ `s` tới một trạm `m` ở giữa, bình luôn `≥ 0`; xuất phát từ `m` với bình rỗng chỉ có thể tệ hơn, nên cũng cạn trước hoặc tại `i`.

## Hướng xử lý
1. Thử từng điểm xuất phát rồi mô phỏng là `O(n²)`.
2. Dùng bổ đề: duyệt một lượt, giữ `tank` tính từ ứng viên `start`. Khi `tank < 0` tại `i`, loại cả đoạn `start…i`, đặt `start = i + 1`, `tank = 0`.
3. Song song cộng `total`. Cuối cùng: `total >= 0` thì trả `start`, ngược lại `-1`.

## Ý tưởng triển khai
- Không cần mô phỏng phần "vòng lại": nếu `total ≥ 0` và `start` qua được tới hết mảng, phần đầu mảng chắc chắn đi được (theo điều kiện tồn tại).
- Nếu `start` bị đẩy tới `n` thì khi đó `total < 0`, nên không bao giờ trả về chỉ số ngoài mảng.

## Ví dụ chạy từng bước
**Input:** `gas = [1, 2, 3, 4, 5]`, `cost = [3, 4, 5, 1, 2]`
**Output:** `3`

```
d = [-2, -2, -2, +3, +3]
i=0: tank = -2 < 0 → start = 1, tank = 0      total = -2
i=1: tank = -2 < 0 → start = 2, tank = 0      total = -4
i=2: tank = -2 < 0 → start = 3, tank = 0      total = -6
i=3: tank = 3                                  total = -3
i=4: tank = 6                                  total = 0
total = 0 >= 0 → trả về start = 3
```

Kiểm tra: từ trạm 3 bình lần lượt là `3 → 6 → 4 → 2 → 0`, không lúc nào âm.

**Input:** `gas = [2, 3, 4]`, `cost = [3, 4, 3]` → **Output:** `-1`

```
d = [-1, -1, +1]
i=0: tank = -1 → start = 1 · i=1: tank = -1 → start = 2 · i=2: tank = 1
total = -1 < 0 → -1
```

## Ghi nhớ
Bài vòng tròn với "tài nguyên không được âm" → kiểm tra tổng trước, rồi tham lam bỏ cả đoạn mỗi khi cạn. Điểm xuất phát chính là ngay sau chỗ tổng tiền tố chạm đáy.
