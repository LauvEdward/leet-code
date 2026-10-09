---
id: 1
title: Two Sum
slug: two-sum
difficulty: Easy
topics: Array, Hash Table
date: 2026-10-09
time: O(n)
space: O(n)
status: Accepted
---
## Đề bài
Cho mảng số nguyên `nums` và số `target`. Trả về chỉ số của hai phần tử có tổng bằng `target`. Đề đảm bảo có đúng một đáp án và không được dùng một phần tử hai lần.

## Cơ sở lý thuyết
- **Bảng băm (Hash Table)**: cấu trúc ánh xạ khóa → giá trị, tra cứu và chèn trung bình `O(1)`. Trong Swift đó là `Dictionary`.
- **Bài toán "phần bù" (complement)**: thay vì hỏi "cặp nào có tổng bằng target?", ta hỏi "với số `x` đang xét, số `target - x` đã từng xuất hiện chưa?". Câu hỏi thứ hai trả lời được bằng một lần tra bảng băm.
- Đánh đổi kinh điển **thời gian ↔ bộ nhớ**: dùng thêm `O(n)` bộ nhớ để giảm thời gian từ `O(n²)` xuống `O(n)`.

## Hướng xử lý
1. Cách ngây thơ: hai vòng lặp lồng nhau thử mọi cặp `(i, j)` → `O(n²)`.
2. Nhận xét: với mỗi `nums[i]`, phần tử còn lại bắt buộc phải bằng `target - nums[i]`. Việc "tìm một giá trị cụ thể" chính là thế mạnh của bảng băm.
3. Duyệt một lượt từ trái sang phải, vừa duyệt vừa ghi nhớ các số đã qua. Vì chỉ tra những số **đứng trước**, ta không bao giờ dùng trùng một phần tử.

## Ý tưởng triển khai
- Dùng `seen: [Int: Int]` lưu `giá trị → chỉ số`.
- Với mỗi `(i, num)`: nếu `seen[target - num]` tồn tại thì trả về `[j, i]`; ngược lại ghi `seen[num] = i`.
- **Tra trước, ghi sau**: thứ tự này xử lý đúng trường hợp hai số bằng nhau như `[3, 3]`, `target = 6`.
- `return []` ở cuối chỉ để trình biên dịch vui lòng — đề đảm bảo luôn có đáp án.

## Ghi nhớ
Thấy đề hỏi "tìm cặp thỏa điều kiện tổng/hiệu" trên mảng **chưa sắp xếp** → nghĩ ngay tới bảng băm. Nếu mảng đã sắp xếp → hai con trỏ, không cần bộ nhớ phụ.
