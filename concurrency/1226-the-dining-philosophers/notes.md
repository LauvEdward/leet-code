---
id: 1226
title: The Dining Philosophers
slug: the-dining-philosophers
difficulty: Medium
topics: Concurrency, Mutex, Deadlock
date: 2026-10-09
time: O(1) mỗi lần ăn
space: O(1)
status: Test cục bộ (LeetCode không có Swift)
---
## Đề bài
Năm triết gia ngồi quanh bàn tròn, giữa hai người kề nhau có một chiếc nĩa (tổng cộng 5 nĩa). Muốn ăn phải cầm được **cả hai** nĩa bên trái và bên phải. Cài đặt `wantsToEat(...)` sao cho không ai bị đói mãi và chương trình không bao giờ deadlock.

## Cơ sở lý thuyết
- **Mutex (khóa loại trừ)**: mỗi lúc chỉ một luồng giữ được. Mỗi chiếc nĩa là một mutex. Trong Swift: `NSLock`.
- **Bốn điều kiện Coffman** — deadlock chỉ xảy ra khi có đủ cả bốn:
   1. *Loại trừ lẫn nhau*: tài nguyên không chia sẻ được.
   2. *Giữ và chờ*: giữ một tài nguyên trong lúc chờ tài nguyên khác.
   3. *Không thu hồi*: không ai giật được tài nguyên của luồng khác.
   4. *Chờ vòng tròn*: A chờ B, B chờ C, …, E chờ A.
- Phá **một** trong bốn điều kiện là đủ ngăn deadlock. Dễ phá nhất là điều kiện 4 bằng **thứ tự tài nguyên (resource ordering)**: đánh số mọi tài nguyên và luôn khóa theo thứ tự tăng dần.

## Hướng xử lý
1. Cách ngây thơ: ai cũng cầm nĩa trái trước rồi nĩa phải. Nếu cả năm người cùng cầm nĩa trái một lúc → mỗi người giữ một nĩa và chờ nĩa của người bên cạnh → vòng chờ khép kín → deadlock.
2. Áp dụng thứ tự tài nguyên: nĩa đánh số `0…4`, mỗi người luôn khóa nĩa **số nhỏ hơn** trước.
3. Vì sao hết deadlock: triết gia `0…3` lấy nĩa trái (`p`) trước rồi nĩa phải (`p + 1`); riêng triết gia `4` có nĩa trái là `4`, nĩa phải là `0` nên lấy nĩa `0` trước — **ngược chiều** với bốn người kia. Vòng tròn bị phá: không thể có chuỗi chờ mà số nĩa cứ tăng mãi rồi quay lại đầu.

Các cách khác: dùng semaphore giá trị `4` chỉ cho tối đa bốn người ngồi vào bàn cùng lúc; hoặc một mutex toàn cục (đúng nhưng mất tính song song — hai người không kề nhau lẽ ra ăn cùng lúc được).

## Ý tưởng triển khai
- `forks`: mảng 5 `NSLock`. Nĩa trái của triết gia `p` là `p`, nĩa phải là `(p + 1) % 5`.
- `a = min(l, r)`, `b = max(l, r)`; khóa `a` rồi `b`.
- Khi đã giữ cả hai khóa mới gọi lần lượt `pickLeftFork`, `pickRightFork`, `eat`, `putLeftFork`, `putRightFork` — thứ tự gọi callback không cần trùng thứ tự khóa.
- Mở khóa theo thứ tự ngược lại (`b` rồi `a`) — thói quen tốt, dù thứ tự mở không ảnh hưởng tới deadlock.

## Ví dụ chạy từng bước
**Input:** `n = 1` — mỗi triết gia muốn ăn 1 lần; xét kịch bản xấu nhất là cả 5 người cùng đói một lúc.
**Output:** một dãy các bộ `[triết gia, nĩa, hành động]` hợp lệ, ví dụ bắt đầu bằng `[3,1,1],[3,2,1],[3,0,3],[3,1,2],[3,2,2],…` (triết gia 3 cầm nĩa trái, nĩa phải, ăn, đặt trái, đặt phải).

Nĩa trái của triết gia `p` là `p`, nĩa phải là `(p + 1) % 5`; ai cũng khóa nĩa số nhỏ trước.

```
P0: cần nĩa 0 rồi 1 → khóa nĩa 0 ✓
P1: cần nĩa 1 rồi 2 → khóa nĩa 1 ✓
P2: cần nĩa 2 rồi 3 → khóa nĩa 2 ✓
P3: cần nĩa 3 rồi 4 → khóa nĩa 3 ✓
P4: cần nĩa 0 rồi 4 → nĩa 0 đang bị P0 giữ → CHỜ (chưa cầm nĩa nào, nĩa 4 vẫn trống)

P3: khóa nĩa 4 ✓ → ĂN → nhả nĩa 4, 3
P2: khóa nĩa 3 ✓ → ĂN → nhả nĩa 3, 2
P1: khóa nĩa 2 ✓ → ĂN → nhả nĩa 2, 1
P0: khóa nĩa 1 ✓ → ĂN → nhả nĩa 1, 0
P4: khóa nĩa 0 ✓ → khóa nĩa 4 ✓ → ĂN
```

So sánh với cách ngây thơ (ai cũng cầm nĩa trái trước): P4 sẽ cầm nĩa 4, khi đó P3 không lấy được nĩa 4, và cả năm người giữ một nĩa, chờ nhau thành vòng tròn → deadlock.

## Ghi nhớ
Cần khóa nhiều mutex cùng lúc → luôn khóa theo **một thứ tự toàn cục cố định**. Đây là quy tắc thực chiến quan trọng nhất để tránh deadlock, áp dụng y nguyên khi viết code iOS với nhiều `NSLock` hay nhiều serial queue.
