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

## Ví dụ chạy từng bước
**Input:** `nums = [2, 7, 11, 15]`, `target = 9`
**Output:** `[0, 1]`

```
i=0, x=2 : cần 9-2 = 7, seen = {}        → chưa có → ghi seen = {2: 0}
i=1, x=7 : cần 9-7 = 2, seen = {2: 0}    → có 2 ở vị trí 0 → trả về [0, 1]
```

**Input:** `nums = [3, 2, 4]`, `target = 6`
**Output:** `[1, 2]`

```
i=0, x=3 : cần 3, seen = {}              → chưa có → seen = {3: 0}
i=1, x=2 : cần 4, seen = {3: 0}          → chưa có → seen = {3: 0, 2: 1}
i=2, x=4 : cần 2, seen = {3: 0, 2: 1}    → có 2 ở vị trí 1 → trả về [1, 2]
```

Ở ví dụ 2, số `3` cần chính nó (`3 + 3 = 6`) nhưng vì tra trước khi ghi nên không tự ghép với mình.

## Ghi nhớ
Thấy đề hỏi "tìm cặp thỏa điều kiện tổng/hiệu" trên mảng **chưa sắp xếp** → nghĩ ngay tới bảng băm. Nếu mảng đã sắp xếp → hai con trỏ, không cần bộ nhớ phụ.
