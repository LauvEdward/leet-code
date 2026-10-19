---
id: 452
title: Minimum Number of Arrows to Burst Balloons
slug: minimum-number-of-arrows-to-burst-balloons
difficulty: Medium
topics: Intervals, Greedy, Sorting
date: 2026-10-19
time: O(n log n)
space: O(n)
status: Chưa nộp (LeetCode trong Chrome chưa đăng nhập)
---
## Đề bài
Mỗi quả bóng là một khoảng `[x_start, x_end]` trên trục hoành. Một mũi tên bắn thẳng đứng tại `x` làm nổ mọi quả bóng có `x_start ≤ x ≤ x_end`. Tìm số mũi tên ít nhất để nổ hết.

## Cơ sở lý thuyết
- Bài toán **phủ điểm cho khoảng (interval stabbing)**, đối ngẫu của "chọn nhiều khoảng rời nhau nhất".
- **Tham lam theo điểm cuối**: xét quả bóng kết thúc sớm nhất chưa bị nổ. Một mũi tên nào đó bắt buộc phải nằm trong nó; đặt mũi tên **tại điểm cuối** của nó là tốt nhất, vì vị trí này nổ được mọi quả bóng mà bất kỳ vị trí nào khác trong khoảng đó nổ được (lập luận đổi chỗ).
- Phải sắp theo **điểm cuối**; sắp theo điểm đầu sẽ sai khi một bóng dài bao quanh nhiều bóng ngắn.

## Hướng xử lý
1. Sắp các bóng theo điểm cuối tăng dần.
2. Bắn mũi đầu tiên tại điểm cuối của bóng đầu tiên.
3. Duyệt: bóng nào bắt đầu **sau** vị trí mũi tên vừa bắn thì không bị nổ → bắn mũi mới tại điểm cuối của nó.

## Ý tưởng triển khai
- Điều kiện `p[0] > end` (chặt): bóng bắt đầu đúng tại `end` vẫn bị nổ.
- Vòng lặp duyệt cả bóng đầu tiên; với nó `p[0] > end` luôn sai nên không ảnh hưởng.
- Tọa độ tới `±2³¹`; chỉ so sánh, không cộng trừ, nên không lo tràn.
- Test cục bộ: vét cạn mọi tập vị trí bắn lấy trong các điểm cuối.

## Ví dụ chạy từng bước
**Input:** `points = [[10, 16], [2, 8], [1, 6], [7, 12]]`
**Output:** `2`

```
Sắp theo điểm cuối: [1,6], [2,8], [7,12], [10,16]
Mũi 1 tại x = 6                    arrows = 1
[2,8]:   2 > 6 sai → đã nổ
[7,12]:  7 > 6 → bắn mũi 2 tại 12  arrows = 2
[10,16]: 10 > 12 sai → đã nổ
Trả về 2
```

**Input:** `points = [[1, 2], [2, 3], [3, 4], [4, 5]]` → **Output:** `2`

```
Mũi 1 tại 2: nổ [1,2], [2,3] (chạm mép vẫn nổ)
[3,4]: 3 > 2 → mũi 2 tại 4: nổ [3,4], [4,5]
```

## Ghi nhớ
Tham lam trên khoảng: muốn **phủ** hoặc **chọn nhiều khoảng rời nhau nhất** → sắp theo điểm **cuối**, luôn quyết định tại điểm cuối sớm nhất. Muốn **gộp** → sắp theo điểm đầu.
