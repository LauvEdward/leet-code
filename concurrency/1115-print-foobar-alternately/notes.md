---
id: 1115
title: Print FooBar Alternately
slug: print-foobar-alternately
difficulty: Medium
topics: Concurrency, Semaphore
date: 2026-10-09
time: O(n)
space: O(1)
status: Test cục bộ (LeetCode không có Swift)
---
## Đề bài
Hai luồng cùng dùng một đối tượng `FooBar(n)`: luồng A gọi `foo()` (in "foo" `n` lần), luồng B gọi `bar()` (in "bar" `n` lần). Phải in ra đúng `foobar` lặp lại `n` lần.

## Cơ sở lý thuyết
- **Luân phiên nghiêm ngặt (strict alternation)** giữa hai luồng — còn gọi là mẫu **ping-pong**: mỗi luồng làm một bước rồi **trao lượt** cho luồng kia và tự đi ngủ.
- Dùng **hai semaphore nhị phân** làm "thẻ lượt": tại mọi thời điểm tổng giá trị của hai semaphore cộng số luồng đang in luôn bằng 1 → không bao giờ có hai luồng cùng in.
- Giá trị khởi tạo quyết định **ai đi trước**: semaphore của `foo` bắt đầu bằng `1`, của `bar` bằng `0`.

## Hướng xử lý
1. Khác bài 1114 (mỗi hàm chạy một lần), ở đây thứ tự phải giữ qua `n` vòng → tín hiệu phải đi **hai chiều**.
2. `foo` cần lượt để in; in xong thì đưa lượt cho `bar`.
3. `bar` cần lượt để in; in xong thì trả lượt cho `foo`.
4. Một `NSLock` thông thường không làm được: mutex chỉ đảm bảo "không cùng lúc", không đảm bảo "xen kẽ" — một luồng có thể giành lại khóa ngay sau khi nhả.

## Ý tưởng triển khai
- `fooSem = 1`, `barSem = 0`.
- Vòng lặp của `foo`: `fooSem.wait()` → in → `barSem.signal()`.
- Vòng lặp của `bar`: `barSem.wait()` → in → `fooSem.signal()`.
- Sau vòng cuối, `bar` vẫn `signal` cho `fooSem` thêm một lần thừa — vô hại vì không còn ai chờ.

## Ghi nhớ
Hai luồng xen kẽ → hai semaphore, mỗi bên `wait` cái của mình và `signal` cái của bên kia. Mutex bảo vệ dữ liệu; semaphore (hoặc condition variable) mới điều khiển **thứ tự**.
