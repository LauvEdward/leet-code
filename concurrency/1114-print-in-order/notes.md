---
id: 1114
title: Print in Order
slug: print-in-order
difficulty: Easy
topics: Concurrency, Semaphore
date: 2026-10-09
time: O(1)
space: O(1)
status: Test cục bộ (LeetCode không có Swift)
---
## Đề bài
Một đối tượng `Foo` có ba phương thức `first()`, `second()`, `third()`, được gọi bởi ba luồng khác nhau theo thứ tự bất kỳ. Phải đảm bảo chúng luôn chạy đúng thứ tự `first → second → third`.

## Cơ sở lý thuyết
- **Luồng (thread)** chạy xen kẽ không đoán trước được: hệ điều hành quyết định luồng nào chạy lúc nào. Muốn có thứ tự thì phải **đồng bộ hóa** tường minh.
- **Semaphore** là một bộ đếm số nguyên với hai thao tác nguyên tử: `wait()` giảm bộ đếm, nếu bộ đếm đang bằng 0 thì luồng **ngủ** cho tới khi có người `signal()`; `signal()` tăng bộ đếm và đánh thức một luồng đang chờ.
- Semaphore khởi tạo bằng **0** đóng vai trò "cổng đang đóng": ai tới trước cũng phải chờ cho tới khi sự kiện xảy ra. Vì `signal()` được **ghi nhớ** trong bộ đếm, không sợ mất tín hiệu khi `signal` chạy trước `wait`.
- Trong Swift: `DispatchSemaphore(value:)` của Grand Central Dispatch.

## Hướng xử lý
1. Có hai quan hệ "phải xảy ra trước": `first` trước `second`, và `second` trước `third`. Mỗi quan hệ cần một cổng.
2. `first` không chờ ai — chạy xong thì mở cổng 1.
3. `second` chờ cổng 1, chạy, rồi mở cổng 2.
4. `third` chờ cổng 2 rồi chạy.

Cách sai thường gặp: dùng biến cờ `Bool` rồi lặp `while !done {}` (busy-wait) — vừa tốn CPU vừa là data race vì đọc/ghi biến chung không khóa.

## Ý tưởng triển khai
- Hai semaphore `s1`, `s2` cùng khởi tạo `0`.
- `first`: in → `s1.signal()`.
- `second`: `s1.wait()` → in → `s2.signal()`.
- `third`: `s2.wait()` → in.
- Nếu `third` được gọi đầu tiên, nó ngủ ở `s2.wait()`; `second` ngủ ở `s1.wait()`; chỉ `first` chạy được, và dây chuyền tự mở dần.

## Ví dụ chạy từng bước
**Input:** `nums = [3, 1, 2]` — nghĩa là luồng A gọi `third()`, luồng B gọi `first()`, luồng C gọi `second()`, theo đúng thứ tự khởi động đó.
**Output:** `"firstsecondthird"`

Ban đầu `s1 = 0`, `s2 = 0`.

```
Luồng A: third()  → s2.wait(): s2 = 0 → NGỦ
Luồng B: first()  → in "first" → s1.signal(): s1 = 1
Luồng C: second() → s1.wait(): s1 = 1 → 0, đi tiếp
                  → in "second" → s2.signal(): đánh thức luồng A
Luồng A: (thức dậy) → in "third"
```

Nếu luồng C chạy trước cả luồng B thì nó ngủ ở `s1.wait()` y như luồng A ngủ ở `s2.wait()`; chỉ `first()` là không phải chờ ai, nên kết quả luôn giống nhau.

## Ghi nhớ
"Sự kiện A phải xảy ra trước B" → một semaphore giá trị 0, A `signal`, B `wait`. Đây là viên gạch cơ bản cho mọi bài sắp thứ tự luồng. Với Swift hiện đại (async/await) có thể dùng `AsyncStream` hay continuation, nhưng semaphore vẫn là cách diễn đạt trực tiếp nhất cho bài kiểu này.
