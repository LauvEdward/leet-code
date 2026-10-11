---
id: 121
title: Best Time to Buy and Sell Stock
slug: best-time-to-buy-and-sell-stock
difficulty: Easy
topics: Array / String, Dynamic Programming
date: 2026-10-11
time: O(n)
space: O(1)
status: Accepted
---
## Đề bài
`prices[i]` là giá cổ phiếu ngày `i`. Mua một lần và bán một lần ở ngày sau đó; tìm lợi nhuận lớn nhất (không lời được thì trả `0`).

## Cơ sở lý thuyết
- **Duyệt một lượt, nhớ giá trị tốt nhất phía trước**: nếu bán ở ngày `j`, ngày mua tốt nhất là ngày có giá **thấp nhất** trong các ngày trước đó. Chỉ cần nhớ đúng một số: giá thấp nhất đã gặp.
- Có thể coi là DP: `best[j] = max(best[j-1], prices[j] - min(prices[0…j]))`, nén còn hai biến.
- Tương đương bài "mảng con có tổng lớn nhất" (Kadane) trên dãy chênh lệch giá giữa các ngày.

## Hướng xử lý
1. Vét cạn mọi cặp (mua, bán) là `O(n²)`.
2. Duyệt từ trái sang phải, giữ `lo` = giá thấp nhất đã thấy.
3. Tại mỗi ngày, thử bán: lợi nhuận `p - lo`; cập nhật đáp án.

## Ý tưởng triển khai
- Cập nhật `lo` **trước** rồi mới tính `p - lo`: khi đó tệ nhất là mua và bán cùng ngày, lợi nhuận `0`, nên đáp án không bao giờ âm.
- `lo = Int.max` ban đầu để ngày đầu tiên luôn được nhận.

## Ví dụ chạy từng bước
**Input:** `prices = [7, 1, 5, 3, 6, 4]`
**Output:** `5` (mua giá 1, bán giá 6)

```
p=7: lo=7 → lời 0 → best=0
p=1: lo=1 → lời 0 → best=0
p=5: lo=1 → lời 4 → best=4
p=3: lo=1 → lời 2 → best=4
p=6: lo=1 → lời 5 → best=5
p=4: lo=1 → lời 3 → best=5
```

**Input:** `prices = [7, 6, 4, 3, 1]` → **Output:** `0`

```
Giá giảm liên tục: lo luôn bằng giá hôm đó → lời 0 mỗi ngày → best = 0
```

## Ghi nhớ
"Cặp `(i, j)` với `i < j` tối ưu hóa `a[j] - a[i]`" → duyệt `j`, nhớ `min` phía trước. Không được bán trước khi mua, nên chỉ nhìn về bên trái.
