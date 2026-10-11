---
id: 523001
title: Three Fibonacci Sum
slug: three-fibonacci-sum
difficulty: Easy
topics: Weekly Contest 523, Math, Simulation
date: 2026-10-11
time: O(log n)
space: O(1)
status: Chưa nộp (bài chưa mở ngoài trang contest)
---
## Đề bài
Cho số nguyên `n` (`1 ≤ n ≤ 10⁹`). Trả về `true` nếu `n` bằng tổng của **ba số liên tiếp** trong dãy Fibonacci `0, 1, 1, 2, 3, 5, 8, …`.

## Cơ sở lý thuyết
- **Dãy Fibonacci tăng theo hàm mũ** (xấp xỉ nhân `1.618` mỗi bước): chỉ khoảng 45 số hạng là đã vượt `10⁹`. Vì thế duyệt thẳng toàn bộ dãy là `O(log n)`.
- **Cửa sổ trượt ba phần tử** trên một dãy sinh dần: không cần lưu cả dãy, chỉ giữ ba số liên tiếp `(a, b, c)` và dịch thành `(b, c, b + c)`.
- Ghi chú: `F(i) + F(i+1) + F(i+2) = 2·F(i+2)`, nên câu hỏi tương đương "`n` chẵn và `n / 2` là số Fibonacci (từ `F(2)` trở đi)". Không cần dùng, nhưng giải thích vì sao đáp án thưa.

## Hướng xử lý
1. Bắt đầu với ba số đầu `(0, 1, 1)`.
2. Lặp khi tổng ba số chưa vượt `n`: nếu tổng bằng `n` thì trả `true`; ngược lại dịch cửa sổ.
3. Tổng tăng nghiêm ngặt sau mỗi lần dịch, nên khi vượt `n` thì chắc chắn không còn cơ hội → `false`.

## Ý tưởng triển khai
- Gán bộ ba đồng thời bằng tuple: `(a, b, c) = (b, c, b + c)` — không cần biến tạm.
- Tổng lớn nhất được tính chỉ cỡ vài tỉ, không lo tràn `Int` 64 bit.

## Ví dụ chạy từng bước
**Input:** `n = 16` → **Output:** `true`

```
(a, b, c) = (0, 1, 1): tổng 2  ≠ 16 → dịch
(a, b, c) = (1, 1, 2): tổng 4  ≠ 16 → dịch
(a, b, c) = (1, 2, 3): tổng 6  ≠ 16 → dịch
(a, b, c) = (2, 3, 5): tổng 10 ≠ 16 → dịch
(a, b, c) = (3, 5, 8): tổng 16 = n → true
```

**Input:** `n = 8` → **Output:** `false`

```
Các tổng lần lượt: 2, 4, 6, rồi 10 > 8 → thoát vòng lặp → false
(1 + 2 + 5 = 8 nhưng ba số đó không liên tiếp)
```

**Input:** `n = 2` → **Output:** `true` (ngay bộ ba đầu tiên `0 + 1 + 1`).

## Ghi nhớ
Dãy tăng theo hàm mũ (Fibonacci, lũy thừa 2, giai thừa) chỉ có vài chục số hạng trong phạm vi `10⁹`–`10¹⁸` → cứ sinh hết ra mà duyệt.
