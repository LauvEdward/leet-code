---
id: 1117
title: Building H2O
slug: building-h2o
difficulty: Medium
topics: Concurrency, Semaphore, Mutex
date: 2026-10-09
time: O(1) mỗi luồng
space: O(1)
status: Test cục bộ (LeetCode không có Swift)
---
## Đề bài
Có nhiều luồng hydro (gọi `hydrogen()`) và oxy (gọi `oxygen()`) tới theo thứ tự bất kỳ. Phải cho chúng "đi qua" theo từng nhóm ba tạo thành phân tử nước: trong chuỗi kết quả, cứ ba ký tự liên tiếp phải gồm đúng 2 `H` và 1 `O`.

## Cơ sở lý thuyết
- **Semaphore đếm (counting semaphore)**: giá trị khởi tạo `k > 1` cho phép tối đa `k` luồng đi qua — dùng để mô hình hóa "còn `k` chỗ trống".
- **Rào chắn / gom nhóm (barrier, rendezvous)**: một nhóm luồng chỉ được đi tiếp khi đã đủ thành phần. Đây là bài kinh điển trong *The Little Book of Semaphores*.
- **Deadlock do giữ-và-chờ (hold and wait)**: hai luồng mỗi bên giữ một phần tài nguyên và chờ phần còn lại mà bên kia đang giữ → cả hai kẹt mãi. Cách chữa: bắt việc "lấy nhiều tài nguyên" phải diễn ra **nguyên khối** bằng một mutex.

## Hướng xử lý
1. Mỗi phân tử có 2 chỗ cho H → semaphore `h = 2`: tối đa hai H được in trong một phân tử, H thứ ba phải chờ.
2. O chỉ được in khi đã có đủ 2 H → semaphore `o = 0`, mỗi H in xong `signal` một lần, O phải `wait` **hai lần**.
3. O in xong thì phân tử hoàn tất → `h.signal()` hai lần để mở chỗ cho phân tử kế tiếp.
4. **Cạm bẫy**: nếu hai luồng O cùng lúc mỗi bên lấy được một `o.wait()`, cả hai chờ cái thứ hai mãi mãi — trong khi `h` đã hết chỗ nên không H nào tới cứu. Phải bọc hai lần `wait` trong một `NSLock` để mỗi lúc chỉ một O gom H.

## Ý tưởng triển khai
- `hydrogen`: `h.wait()` → in H → `o.signal()`.
- `oxygen`: `oLock.lock()` → `o.wait()` ×2 → in O → `h.signal()` ×2 → `oLock.unlock()`.
- Thứ tự in trong một phân tử luôn là `H H O`. Đề chấp nhận mọi hoán vị, nên đây là một đáp án hợp lệ và đơn giản nhất.
- Vì sao nhóm ba không lẫn sang nhau: H của phân tử sau chỉ qua được `h.wait()` **sau khi** O của phân tử trước đã in và `signal`.

## Ví dụ chạy từng bước
**Input:** `water = "OOHHHH"` — 2 luồng oxy tới trước, rồi 4 luồng hydro.
**Output:** `"HHOHHO"` (mọi kết quả mà cứ 3 ký tự gồm 2 `H` + 1 `O` đều được chấp nhận)

Ban đầu `h = 2`, `o = 0`.

```
O1: lấy oLock → o.wait(): 0 → NGỦ (vẫn giữ oLock)
O2: chờ oLock
H1: h.wait(): 2 → 1 → in H → o.signal()   (O1 nhận 1/2)
H2: h.wait(): 1 → 0 → in H → o.signal()   (O1 nhận 2/2)
H3: h.wait(): 0 → NGỦ
H4: h.wait(): 0 → NGỦ
O1: (đủ 2 H) → in O → h.signal() ×2 → nhả oLock        ← xong phân tử 1: H H O
H3: (thức dậy) → in H → o.signal()
H4: (thức dậy) → in H → o.signal()
O2: lấy oLock → o.wait() ×2 ✓ → in O → h.signal() ×2   ← xong phân tử 2: H H O
```

Nếu bỏ `oLock`: O1 và O2 có thể mỗi bên lấy được một tín hiệu từ H1, H2 rồi cùng chờ tín hiệu thứ hai, trong khi H3, H4 đang ngủ vì `h = 0` → deadlock.

## Ghi nhớ
"Cần `k` đơn vị mới được chạy" → `wait` `k` lần, nhưng nhớ khóa lại để việc gom không bị chia đôi giữa hai luồng. Khi phân tích deadlock, tự hỏi: có tình huống nào hai luồng mỗi bên giữ một nửa không?
