---
id: 45
title: Jump Game II
slug: jump-game-ii
difficulty: Medium
topics: Array / String, Greedy, BFS
date: 2026-10-11
time: O(n)
space: O(1)
status: Accepted
---
## Đề bài
Như bài 55 nhưng đề đảm bảo luôn tới được ô cuối; tìm **số lần nhảy ít nhất**.

## Cơ sở lý thuyết
- **BFS ngầm theo tầng**: tầng `t` là tập các ô tới được với đúng `t` lần nhảy. Vì các ô tới được tạo thành đoạn liền, mỗi tầng cũng là một **đoạn liền** — không cần hàng đợi, chỉ cần biên phải của tầng.
- Tham lam: trong tầng hiện tại, tính điểm xa nhất `far` mà một cú nhảy nữa vươn tới. Khi đi hết tầng, bắt buộc phải nhảy thêm một lần, và tầng mới kéo dài tới `far`.

## Hướng xử lý
1. `end` = biên phải của tầng hiện tại, `far` = tầm với xa nhất tính từ các ô đã duyệt, `jumps = 0`.
2. Duyệt `i` từ `0` đến `n - 2`: cập nhật `far`.
3. Khi `i == end` (hết tầng): `jumps += 1`, `end = far`.
4. Trả về `jumps`.

## Ý tưởng triển khai
- Chỉ duyệt tới `n - 2`: nếu duyệt cả ô cuối và nó trùng `end` thì sẽ đếm thừa một cú nhảy.
- Mảng 1 phần tử: khoảng `0..<0` rỗng → `0` lần nhảy.

## Ví dụ chạy từng bước
**Input:** `nums = [2, 3, 1, 1, 4]`
**Output:** `2` (ô 0 → ô 1 → ô 4)

```
Ban đầu: jumps=0, end=0, far=0
i=0: far = max(0, 0+2) = 2 · i == end → jumps=1, end=2    (tầng 1 = ô 1..2)
i=1: far = max(2, 1+3) = 4
i=2: far = max(4, 2+1) = 4 · i == end → jumps=2, end=4    (tầng 2 = ô 3..4)
i=3: far = 4 · 3 ≠ end
Hết vòng lặp (i chỉ tới n-2 = 3) → 2
```

**Input:** `nums = [1, 1, 1, 1]` → **Output:** `3`

```
i=0: far=1, i == end(0) → jumps=1, end=1
i=1: far=2, i == end(1) → jumps=2, end=2
i=2: far=3, i == end(2) → jumps=3, end=3
```

## Ghi nhớ
"Số bước ít nhất" trên mảng với bước nhảy trong một khoảng → BFS theo tầng, mỗi tầng là một đoạn `[bắt đầu, end]`. Ba biến `jumps`, `end`, `far` là đủ.
