---
id: 523003
title: Design Bus Seat Booking System
slug: design-bus-seat-booking-system
difficulty: Medium
topics: Weekly Contest 523, Design, Hash Table, Simulation
date: 2026-10-11
time: O(1) trung bình mỗi thao tác
space: O(số ghế đang đặt)
status: Chưa nộp (bài chưa mở ngoài trang contest)
---
## Đề bài
Xe buýt có `n` hàng, mỗi hàng bốn ghế `A B C D` (`A`, `D` sát cửa sổ; `A` kề `B`, `D` kề `C`). Đặt ghế giữa luôn mất 1 giây; đặt ghế cửa sổ mất 1 giây, hoặc 3 giây nếu ghế giữa kề nó **đã được đặt**. Cài đặt `toggle(seat)` (đặt nếu trống, hủy nếu đã đặt), `getTotalTime()` (tổng thời gian của các ghế đang đặt, theo đúng thứ tự đã đặt) và `getMinTime()` (tổng thời gian nhỏ nhất nếu được chọn lại thứ tự đặt).

## Cơ sở lý thuyết
- **Duy trì tổng tăng dần (running total)**: thay vì tính lại từ đầu mỗi lần hỏi, cập nhật tổng tại mỗi thao tác. Muốn hoàn tác được thì phải nhớ **đóng góp của từng phần tử** — ở đây là chi phí của từng ghế tại thời điểm nó được đặt.
- **Chi phí được chốt tại lúc đặt** (đề nói rõ): việc đặt hay hủy ghế khác về sau không đổi chi phí của ghế đã đặt. Nên khi hủy, trừ đúng con số đã lưu, không tính lại.
- **Tối ưu thứ tự bằng lập luận trực tiếp**: phụ phí chỉ phát sinh khi ghế cửa sổ được đặt **sau** ghế giữa kề nó. Nếu đặt hết ghế cửa sổ trước rồi mới tới ghế giữa thì không ghế nào bị phụ phí → mọi ghế tốn đúng 1 giây, và không thể thấp hơn 1 giây mỗi ghế.

## Hướng xử lý
1. Lưu `cost[seat]` cho các ghế đang được đặt, và biến `total`.
2. `toggle`:
   - Ghế đang đặt → `total -= cost[seat]`, xóa khỏi bảng.
   - Ghế trống → chi phí là `3` nếu nó là `A` và `B` cùng hàng đang đặt, hoặc là `D` và `C` cùng hàng đang đặt; ngược lại `1`. Lưu lại và cộng vào `total`.
3. `getTotalTime` trả `total`.
4. `getMinTime` trả **số ghế đang đặt**.

## Ý tưởng triển khai
- Khóa của bảng băm là chính chuỗi tên ghế (`"A3"`); ghế kề được dựng bằng nội suy chuỗi: `"B\(row)"` với `row = seat.dropFirst()`.
- `cost[seat] != nil` vừa là phép kiểm tra "đang đặt", nên không cần thêm `Set`.
- Tham số `n` không cần dùng — bảng băm chỉ chứa ghế đang đặt.
- Test cục bộ: so `getTotalTime` với một mô phỏng độc lập, và so `getMinTime` với vét cạn mọi thứ tự đặt (tối đa 6 ghế) trên 300 chuỗi thao tác ngẫu nhiên.

## Ví dụ chạy từng bước
**Input:** `BusBooking(20)`, `toggle("B3")`, `toggle("A3")`, `getTotalTime()`, `getMinTime()`, `toggle("C3")`, `toggle("D3")`, `getTotalTime()`, `getMinTime()`
**Output:** `4`, `2`, rồi `8`, `4`

```
toggle("B3"): ghế giữa → 1          cost = {B3: 1}                      total = 1
toggle("A3"): cửa sổ, B3 đang đặt → 3   cost = {B3: 1, A3: 3}           total = 4
getTotalTime() → 4
getMinTime()   → 2 ghế → 2          (đặt A3 trước B3 thì mỗi ghế 1 giây)
toggle("C3"): ghế giữa → 1          cost = {B3: 1, A3: 3, C3: 1}        total = 5
toggle("D3"): cửa sổ, C3 đang đặt → 3   cost = {…, D3: 3}               total = 8
getTotalTime() → 8
getMinTime()   → 4 ghế → 4
```

**Input:** `BusBooking(10)`, `toggle("C7")`, `toggle("D7")`, `getTotalTime()`, `toggle("D7")`, `toggle("C7")`, `toggle("D7")`, `getTotalTime()`, `getMinTime()`
**Output:** `4`, rồi `1`, `1`

```
toggle("C7"): 1                     cost = {C7: 1}          total = 1
toggle("D7"): C7 đang đặt → 3       cost = {C7: 1, D7: 3}   total = 4
getTotalTime() → 4
toggle("D7"): đang đặt → hủy, trừ 3 cost = {C7: 1}          total = 1
toggle("C7"): đang đặt → hủy, trừ 1 cost = {}               total = 0
toggle("D7"): C7 không còn đặt → 1  cost = {D7: 1}          total = 1
getTotalTime() → 1
getMinTime()   → 1
```

Ví dụ 2 cho thấy vì sao phải lưu chi phí từng ghế: cùng ghế `D7` nhưng lần đầu tốn 3, lần sau tốn 1.

## Ghi nhớ
Bài thiết kế có thao tác "hoàn tác" → lưu đóng góp của từng phần tử để trừ lại đúng. Và khi đề hỏi "nhỏ nhất trên mọi thứ tự", thử tìm một thứ tự đạt cận dưới hiển nhiên trước khi nghĩ tới thuật toán phức tạp.
