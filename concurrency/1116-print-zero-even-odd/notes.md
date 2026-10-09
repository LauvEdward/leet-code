---
id: 1116
title: Print Zero Even Odd
slug: print-zero-even-odd
difficulty: Medium
topics: Concurrency, Semaphore
date: 2026-10-09
time: O(n)
space: O(1)
status: Test cục bộ (LeetCode không có Swift)
---
## Đề bài
Ba luồng dùng chung `ZeroEvenOdd(n)`: luồng `zero()` chỉ in số 0, luồng `even()` chỉ in số chẵn, luồng `odd()` chỉ in số lẻ. Kết quả phải là `0 1 0 2 0 3 … 0 n`.

## Cơ sở lý thuyết
- Mở rộng mẫu ping-pong của bài 1115 lên **ba luồng với một "nhạc trưởng"**: luồng `zero` chạy xen giữa mọi bước và là bên quyết định ai đi tiếp.
- **Chuyển lượt có điều kiện**: thay vì luôn `signal` cho một đối tác cố định, luồng đang giữ lượt chọn semaphore cần đánh thức dựa trên trạng thái (ở đây là tính chẵn lẻ của số sắp in).
- Bất biến: tại mọi thời điểm chỉ có đúng **một thẻ lượt** lưu hành giữa ba semaphore.

## Hướng xử lý
1. Chuỗi in ra có dạng `zero, odd, zero, even, zero, odd, …` — luồng `zero` in ở mọi vị trí lẻ, còn `odd`/`even` thay phiên ở vị trí chẵn.
2. Cho mỗi luồng một semaphore riêng: `z` (bắt đầu `1`, vì 0 được in đầu tiên), `e` và `o` (bắt đầu `0`).
3. `zero` in xong `0` thứ `i` thì đánh thức `odd` nếu `i` lẻ, `even` nếu `i` chẵn.
4. `odd` và `even` in xong đều trả lượt về cho `zero`.

## Ý tưởng triển khai
- `zero`: lặp `i` từ `1` đến `n` — biến `i` chính là số mà luồng kia sắp in, nên dùng luôn để chọn `o.signal()` hay `e.signal()`.
- `even`: `stride(from: 2, through: n, by: 2)`; `odd`: `stride(from: 1, through: n, by: 2)`. Mỗi luồng tự biết mình in những số nào, không cần biến đếm dùng chung → **không có dữ liệu chia sẻ nào cần khóa**.
- Số vòng lặp của ba luồng khớp nhau đúng bằng thiết kế (`n` lần `zero`, `⌊n/2⌋` lần `even`, `⌈n/2⌉` lần `odd`) nên cả ba cùng kết thúc, không luồng nào bị kẹt ở `wait()`.

## Ví dụ chạy từng bước
**Input:** `n = 3`
**Output:** `"010203"`

Ban đầu `z = 1`, `e = 0`, `o = 0`. Luồng `even` và `odd` ngủ ngay ở `wait()` đầu tiên cho tới khi được gọi.

```
zero (i=1): z.wait() ✓ → in 0 → i lẻ  → o.signal()
odd  (i=1): (thức dậy)  → in 1 → z.signal()
zero (i=2): z.wait() ✓ → in 0 → i chẵn → e.signal()
even (i=2): (thức dậy)  → in 2 → z.signal() → hết vòng lặp, xong
zero (i=3): z.wait() ✓ → in 0 → i lẻ  → o.signal() → xong
odd  (i=3): (thức dậy)  → in 3 → z.signal() (thừa) → xong
```

Số lần lặp: `zero` 3 lần, `odd` 2 lần (1, 3), `even` 1 lần (2) — khớp nhau nên không luồng nào bị kẹt.

## Ghi nhớ
Nhiều hơn hai luồng luân phiên → mỗi luồng một semaphore, luồng đang chạy quyết định đánh thức ai. Thiết kế sao cho mỗi luồng tự suy ra được việc của mình từ biến cục bộ sẽ tránh được hẳn data race.
