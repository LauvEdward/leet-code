---
id: 55
title: Jump Game
slug: jump-game
difficulty: Medium
topics: Array / String, Greedy, Dynamic Programming
date: 2026-10-11
time: O(n)
space: O(1)
status: Accepted
---
## Đề bài
Đứng ở ô `0`; `nums[i]` là độ dài nhảy **tối đa** từ ô `i`. Hỏi có tới được ô cuối không.

## Cơ sở lý thuyết
- **Tham lam theo tầm với xa nhất**: tập các ô tới được luôn là một **đoạn liền** `[0, far]` — vì nếu tới được ô `j` bằng một cú nhảy thì cũng tới được mọi ô trước `j` bằng cú nhảy ngắn hơn. Nên chỉ cần nhớ một số `far`.
- So với DP `O(n²)` ("ô `i` tới được nếu có ô `j < i` tới được và `j + nums[j] ≥ i`"), tham lam chỉ cần một lượt.

## Hướng xử lý
1. `far = 0`.
2. Duyệt `i` từ trái sang phải: nếu `i > far` thì ô `i` không tới được → trả `false`.
3. Ngược lại cập nhật `far = max(far, i + nums[i])`.
4. Duyệt hết mà không bị chặn → `true`.

## Ý tưởng triển khai
- Kiểm tra `i > far` **trước** khi dùng `nums[i]` — không được nhảy từ ô mình không tới được.
- Mảng 1 phần tử: `i = 0`, `far = 0`, không bị chặn → `true`.

## Ví dụ chạy từng bước
**Input:** `nums = [2, 3, 1, 1, 4]`
**Output:** `true`

```
i=0: 0 <= far=0 → far = max(0, 0+2) = 2
i=1: 1 <= 2     → far = max(2, 1+3) = 4
i=2: 2 <= 4     → far = max(4, 2+1) = 4
i=3: 3 <= 4     → far = 4
i=4: 4 <= 4     → far = 8
Hết mảng → true
```

**Input:** `nums = [3, 2, 1, 0, 4]`
**Output:** `false`

```
i=0: far = 3
i=1: far = max(3, 1+2) = 3
i=2: far = max(3, 2+1) = 3
i=3: far = max(3, 3+0) = 3
i=4: 4 > far=3 → false   (mọi đường đều kẹt ở ô 3 có giá trị 0)
```

## Ghi nhớ
Khi tập trạng thái tới được là một đoạn liền, chỉ cần theo dõi biên của nó. Bài 45 dùng lại đúng biến `far` để đếm số bước.
