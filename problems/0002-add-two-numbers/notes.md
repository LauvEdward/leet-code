---
id: 2
title: Add Two Numbers
slug: add-two-numbers
difficulty: Medium
topics: Linked List, Math, Recursion
date: 2026-10-09
time: O(max(m, n))
space: O(1) phụ (không tính danh sách kết quả)
status: Accepted
---
## Đề bài
Hai số nguyên không âm được lưu dưới dạng danh sách liên kết, mỗi nút một chữ số, **theo thứ tự ngược** (hàng đơn vị đứng đầu). Trả về tổng của chúng cũng dưới dạng danh sách liên kết ngược.

## Cơ sở lý thuyết
- **Danh sách liên kết đơn**: chỉ đi được một chiều qua `next`, không truy cập ngẫu nhiên.
- **Phép cộng tay theo cột**: cộng từ hàng đơn vị lên, mỗi cột cho ra `chữ số = tổng % 10` và `nhớ = tổng / 10`. Số nhớ luôn chỉ là 0 hoặc 1 vì tối đa `9 + 9 + 1 = 19`.
- **Nút giả (dummy head)**: tạo một nút đứng trước đầu danh sách kết quả để khỏi phải xử lý riêng trường hợp "nút đầu tiên".

## Hướng xử lý
1. Vì chữ số được lưu ngược, đầu danh sách chính là hàng đơn vị — đúng thứ tự mà phép cộng tay cần. Không phải đảo danh sách.
2. Đi song song trên hai danh sách; danh sách nào hết trước thì coi chữ số của nó là `0`.
3. Đừng quên số nhớ cuối cùng: `5 + 5 = 10` phải sinh thêm một nút `1`.

## Ý tưởng triển khai
- Gộp cả ba điều kiện dừng vào một vòng lặp: `while a != nil || b != nil || carry > 0`. Nhờ vậy không cần viết đoạn "xử lý phần còn lại" hay "thêm nút nhớ" riêng.
- `a?.val ?? 0` — optional chaining kết hợp nil-coalescing giúp coi nút thiếu là 0 một cách gọn gàng.
- `tail` luôn trỏ tới nút cuối của kết quả; mỗi vòng gắn nút mới vào `tail.next` rồi dịch `tail`.
- Trả về `dummy.next`.

## Ghi nhớ
Mẫu **dummy head + con trỏ tail** dùng lại được cho hầu hết bài "xây danh sách liên kết mới" (merge, partition, remove...). Không chuyển sang `Int` rồi cộng: số có thể dài tới 100 chữ số, tràn mọi kiểu số nguyên.
