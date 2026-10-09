---
id: 4062
title: Transform Array Using Pair Operations
slug: transform-array-using-pair-operations
difficulty: Medium
topics: Biweekly Contest 192, Array, Math, Invariant
date: 2026-10-09
time: O(n)
space: O(1)
status: Accepted
---
## Đề bài
Cho hai mảng `source`, `target` cùng độ dài `n ≥ 2`. Mỗi thao tác chọn hai chỉ số khác nhau `i`, `j` và một số nguyên `delta` bất kỳ, rồi gán `source[i] = source[i] + source[j] - delta` và `source[j] = delta`. Hỏi có thể biến `source` thành `target` không.

## Cơ sở lý thuyết
- **Bất biến (invariant)**: một đại lượng không đổi qua mọi thao tác. Nếu bất biến của trạng thái đầu và trạng thái đích khác nhau thì chắc chắn **không** tới được. Đây là công cụ chính để chứng minh "không thể".
- Chứng minh "có thể" cần chiều ngược lại: chỉ ra một **cách dựng** cụ thể khi bất biến khớp.
- Bài "biến đổi A thành B bằng thao tác cho trước" gần như luôn giải theo hai bước đó: tìm bất biến → chứng minh nó là điều kiện đủ.

## Hướng xử lý
1. **Tìm bất biến.** Sau thao tác, `source[i] + source[j]` mới bằng `(source[i] + source[j] - delta) + delta` — đúng bằng tổng cũ. Các phần tử khác không đổi. Vậy **tổng cả mảng là bất biến** → nếu tổng khác nhau thì trả `false`.
2. **Hiểu thao tác.** Nó cho phép đặt `source[j]` thành **giá trị tùy ý**, phần chênh lệch dồn hết sang `source[i]`. Nói cách khác: phân phối lại tùy ý tổng của hai phần tử.
3. **Điều kiện đủ.** Chọn phần tử cuối làm "thùng chứa" (`i = n - 1`). Với từng `j` từ `0` đến `n - 2`, làm thao tác với `delta = target[j]` để đặt `source[j]` đúng giá trị. Sau `n - 1` thao tác, `n - 1` phần tử đầu đã khớp; vì tổng được bảo toàn và bằng tổng của `target`, phần tử cuối cũng tự khớp.
4. Kết luận: đáp án là `sum(source) == sum(target)`.

## Ý tưởng triển khai
- Một dòng: `source.reduce(0, +) == target.reduce(0, +)`.
- Tổng tối đa cỡ `10⁵ × 10⁹ = 10¹⁴`, vừa `Int` 64 bit.
- Test cục bộ: ngoài so sánh tổng, còn chạy đúng chuỗi thao tác ở bước 3 để xác nhận nó thật sự tạo ra `target`.

## Ví dụ chạy từng bước
**Input:** `source = [1, 2, 3]`, `target = [0, 2, 4]` → **Output:** `true`

```
sum(source) = 1 + 2 + 3 = 6
sum(target) = 0 + 2 + 4 = 6
6 == 6 → true
```

Dựng lại chuỗi thao tác để thấy vì sao tổng bằng nhau là đủ — dùng phần tử cuối (`i = 2`) làm thùng chứa:

```
Ban đầu:               [1, 2, 3]
j=0, delta=target[0]=0: source[2] = 3 + 1 - 0 = 4, source[0] = 0 → [0, 2, 4]
j=1, delta=target[1]=2: source[2] = 4 + 2 - 2 = 4, source[1] = 2 → [0, 2, 4]
Hai phần tử đầu đã khớp; phần tử cuối tự bằng 6 - 0 - 2 = 4 ✓
```

**Input:** `source = [1, 2, 1]`, `target = [0, 2, 5]` → **Output:** `false`

```
sum(source) = 4, sum(target) = 7 → khác nhau → false
```

## Ghi nhớ
Đề cho thao tác trông rắc rối với tham số tự do (`delta` bất kỳ) → gần như chắc chắn có một bất biến đơn giản (tổng, tính chẵn lẻ, XOR, gcd…) và đáp án chỉ là so sánh bất biến đó. Đừng mô phỏng; hãy cộng hai vế lại xem cái gì không đổi.
