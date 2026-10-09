---
id: 4070
title: Minimum Rotations to Dial a Number I
slug: minimum-rotations-to-dial-a-number-i
difficulty: Easy
topics: Weekly Contest 522, String, Simulation
date: 2026-10-09
time: O(n)
space: O(1)
status: Accepted
---
## Đề bài
Một mặt số tròn có các chữ số `0…9` xếp theo thứ tự (0 và 9 kề nhau), kim ban đầu ở `0`. Cho chuỗi `s` gồm 10 chữ số, phải lần lượt quay kim tới từng chữ số; mỗi lần quay dịch một vị trí theo chiều tùy ý. Tính tổng số lần quay ít nhất.

## Cơ sở lý thuyết
- **Khoảng cách trên vòng tròn**: giữa hai vị trí `a`, `b` trên vòng có `m` điểm, có hai đường đi — xuôi dài `|a - b|` và ngược dài `m - |a - b|`. Khoảng cách ngắn nhất là `min(|a - b|, m - |a - b|)`.
- **Mô phỏng**: các bước độc lập nhau — chọn đường ngắn cho bước này không ảnh hưởng tới bước sau, vì vị trí kết thúc của mỗi bước là cố định (chính là chữ số cần quay tới). Nên tham lam từng bước là tối ưu.

## Hướng xử lý
1. Giữ vị trí hiện tại `cur`, bắt đầu từ `0`.
2. Với mỗi chữ số `x` trong `s`: cộng `min(d, 10 - d)` với `d = |x - cur|`, rồi đặt `cur = x`.

## Ý tưởng triển khai
- `Character.wholeNumberValue!` đổi ký tự chữ số thành `Int` — đề đảm bảo chỉ có chữ số nên force-unwrap thoải mái.
- Không cần `Array(s)` vì chỉ duyệt tuần tự.

## Ghi nhớ
Thấy "vòng tròn" + "quay hai chiều" → công thức `min(d, m - d)`. Đây là bài mở đầu cho bài II (4071), nơi công thức này được dùng lại.
