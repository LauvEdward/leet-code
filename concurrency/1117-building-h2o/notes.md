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

## Ghi nhớ
"Cần `k` đơn vị mới được chạy" → `wait` `k` lần, nhưng nhớ khóa lại để việc gom không bị chia đôi giữa hai luồng. Khi phân tích deadlock, tự hỏi: có tình huống nào hai luồng mỗi bên giữ một nửa không?
