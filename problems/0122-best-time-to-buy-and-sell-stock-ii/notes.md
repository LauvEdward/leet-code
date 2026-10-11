---
id: 122
title: Best Time to Buy and Sell Stock II
slug: best-time-to-buy-and-sell-stock-ii
difficulty: Medium
topics: Array / String, Greedy, Dynamic Programming
date: 2026-10-11
time: O(n)
space: O(1)
status: Accepted
---
## Đề bài
Như bài 121 nhưng được mua bán **nhiều lần** (mỗi lúc giữ tối đa một cổ phiếu, có thể mua và bán cùng ngày). Tìm tổng lợi nhuận lớn nhất.

## Cơ sở lý thuyết
- **Tham lam (greedy)**: một lựa chọn tốt nhất cục bộ dẫn tới tối ưu toàn cục, nếu chứng minh được.
- **Tổng lồng nhau (telescoping)**: lợi nhuận khi giữ từ ngày `a` tới ngày `b` bằng tổng chênh lệch từng ngày: `p[b] - p[a] = (p[a+1] - p[a]) + … + (p[b] - p[b-1])`. Vậy mọi chiến lược đều là việc chọn một tập các "ngày giữ qua đêm".
- Muốn tổng lớn nhất thì chọn đúng những chênh lệch **dương** và bỏ hết chênh lệch âm.

## Hướng xử lý
1. Duyệt các cặp ngày liền nhau.
2. Nếu hôm nay giá cao hơn hôm qua, cộng phần chênh vào đáp án (coi như mua hôm qua, bán hôm nay).
3. Tổng là đáp án.

Cách DP tổng quát (dùng được khi có phí giao dịch hay thời gian chờ): hai trạng thái `cash` (không giữ) và `hold` (đang giữ).

## Ý tưởng triển khai
- `for i in 1..<prices.count where prices[i] > prices[i - 1]`.
- Mảng 1 phần tử: khoảng `1..<1` rỗng, trả `0`.

## Ví dụ chạy từng bước
**Input:** `prices = [7, 1, 5, 3, 6, 4]`
**Output:** `7`

```
7 → 1: -6 → bỏ
1 → 5: +4 → res = 4    (mua 1, bán 5)
5 → 3: -2 → bỏ
3 → 6: +3 → res = 7    (mua 3, bán 6)
6 → 4: -2 → bỏ
```

**Input:** `prices = [1, 2, 3, 4, 5]` → **Output:** `4`

```
+1, +1, +1, +1 → res = 4   (tương đương mua giá 1 giữ tới giá 5)
```

## Ghi nhớ
Được giao dịch không giới hạn → "ăn mọi đoạn tăng". Nếu thêm ràng buộc (tối đa `k` lần, phí, cooldown) thì chuyển sang DP theo trạng thái giữ/không giữ.
