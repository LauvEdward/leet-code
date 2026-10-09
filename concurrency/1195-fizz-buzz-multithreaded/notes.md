---
id: 1195
title: Fizz Buzz Multithreaded
slug: fizz-buzz-multithreaded
difficulty: Medium
topics: Concurrency, Condition Variable
date: 2026-10-09
time: O(n)
space: O(1)
status: Test cục bộ (LeetCode không có Swift)
---
## Đề bài
Bốn luồng dùng chung `FizzBuzz(n)`: `fizz()` in "fizz" cho số chia hết cho 3 (không chia hết cho 5), `buzz()` cho số chia hết cho 5 (không chia hết cho 3), `fizzbuzz()` cho số chia hết cho 15, `number()` in các số còn lại. Kết quả phải đúng thứ tự từ 1 đến `n`.

## Cơ sở lý thuyết
- **Biến điều kiện (condition variable)**: cho phép luồng ngủ cho tới khi một **điều kiện trên trạng thái dùng chung** trở thành đúng. Luôn đi kèm một mutex. Trong Swift: `NSCondition` (gộp sẵn khóa + biến điều kiện).
- Ba thao tác: `wait()` — **nhả khóa và ngủ** một cách nguyên tử, khi thức dậy tự lấy lại khóa; `signal()` — đánh thức một luồng; `broadcast()` — đánh thức tất cả.
- **Thức giấc giả (spurious wakeup)**: luồng có thể tỉnh dậy mà điều kiện chưa đúng. Vì vậy luôn kiểm tra điều kiện trong vòng `while`, không bao giờ dùng `if`.
- So với semaphore: semaphore hợp khi "ai đi tiếp" biết trước; biến điều kiện hợp khi việc đó phụ thuộc vào **trạng thái** (ở đây là giá trị của số hiện tại).

## Hướng xử lý
1. Trạng thái dùng chung duy nhất: số hiện tại `i`. Mỗi luồng có một vị từ "số này có phải của tôi không".
2. Mỗi luồng lặp: khóa → chờ tới khi `i` thuộc về mình (hoặc đã hết số) → xử lý → `i += 1` → đánh thức mọi người → mở khóa.
3. Phải dùng `broadcast()` chứ không phải `signal()`: ta không biết luồng nào là chủ của số kế tiếp; `signal` có thể đánh thức nhầm luồng, nó ngủ lại và cả hệ thống đứng im.
4. **Điều kiện thoát**: khi `i > n` mọi luồng phải thoát. Điều kiện chờ là `i <= n && !mine(i)` nên luồng đang ngủ cũng sẽ tỉnh dậy và thoát sau lần `broadcast` cuối.

## Ý tưởng triển khai
- Cả bốn hàm chỉ khác nhau ở vị từ và hành động → gom vào một hàm `run(mine, act)`.
- Trong `run`: `cond.lock()`; `while i <= n && !mine(i) { cond.wait() }`; nếu `i > n` thì `unlock` và `return`; ngược lại `act(i)`, `i += 1`, `cond.broadcast()`, `cond.unlock()`.
- Gọi `act(i)` **trong khi còn giữ khóa** để đảm bảo việc in và việc tăng `i` là một bước không thể bị chen ngang.
- Nhớ `unlock` trước mọi `return` — quên là các luồng khác treo vĩnh viễn.

## Ví dụ chạy từng bước
**Input:** `n = 5`
**Output:** `[1, 2, "fizz", 4, "buzz"]`

Bốn luồng cùng chờ trên một `NSCondition`, biến chung `i = 1`.

```
i=1: chỉ luồng number thấy "số này của tôi" → in 1 → i=2 → broadcast
     (fizz, buzz, fizzbuzz thức dậy, kiểm tra lại điều kiện, thấy chưa phải lượt → ngủ tiếp)
i=2: number   → in 2      → i=3 → broadcast
i=3: fizz     → in "fizz" → i=4 → broadcast
i=4: number   → in 4      → i=5 → broadcast
i=5: buzz     → in "buzz" → i=6 → broadcast
i=6 > n: cả bốn luồng thức dậy, thấy i > n → unlock và thoát
```

Với `n = 15`, bước cuối `i=15` thuộc về luồng `fizzbuzz` (chia hết cho cả 3 và 5); hai luồng `fizz` và `buzz` bỏ qua số này vì vị từ của chúng loại trừ bội của số còn lại.

## Ghi nhớ
Mẫu chuẩn của biến điều kiện: `lock → while !điều_kiện { wait } → làm việc → broadcast → unlock`. Nhiều luồng với các điều kiện khác nhau cùng chờ trên một biến → dùng `broadcast`.
