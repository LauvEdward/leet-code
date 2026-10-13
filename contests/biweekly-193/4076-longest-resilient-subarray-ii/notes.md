---
id: 4076
title: Longest Resilient Subarray II
slug: longest-resilient-subarray-ii
difficulty: Medium
topics: Biweekly Contest 193, Array, Math, Number Theory
date: 2026-10-11
time: O(n + log k mỗi đoạn)
space: O(1)
status: Accepted
---
## Đề bài
Giống bài I: mảng con là *resilient* nếu xóa bất kỳ phần tử nào thì tổng phần còn lại vẫn chia hết cho `k`; tìm độ dài lớn nhất. Khác ở ràng buộc `n ≤ 10⁵`.

## Cơ sở lý thuyết
- Kết quả từ bài I: mảng con dài `L` là resilient ⟺ mọi phần tử cùng số dư `r` (mod `k`) **và** `(L - 1)·r ≡ 0 (mod k)`.
- **Phương trình đồng dư tuyến tính** `t·r ≡ 0 (mod k)`: nghiệm là mọi `t` chia hết cho `g = k / gcd(r, k)`. Lý do: chia cả hai vế cho `gcd(r, k)`, phần còn lại của `r` nguyên tố cùng nhau với `k / gcd` nên `t` phải gánh hết thừa số đó.
- **Thuật toán Euclid** tính `gcd` trong `O(log)`. Quy ước `gcd(0, k) = k` → khi `r = 0` thì `g = 1`, mọi độ dài đều được.
- **Chia mảng thành các đoạn chạy (run)** tối đa có cùng tính chất, duyệt bằng hai con trỏ trong `O(n)`.

## Hướng xử lý
1. `O(n²)` của bài I không qua được `n = 10⁵`.
2. Vì mọi phần tử phải cùng số dư, mảng con resilient luôn nằm trọn trong một **đoạn chạy cùng số dư**. Tách mảng thành các đoạn chạy như vậy.
3. Với đoạn chạy dài `m`, số dư `r`: mọi mảng con độ dài `L ≤ m` bên trong đều cùng số dư, nên chỉ cần tìm `L` lớn nhất với `L - 1` là bội của `g = k / gcd(r, k)`.
4. `L - 1` lớn nhất không vượt `m - 1` và chia hết cho `g` là `⌊(m - 1) / g⌋ · g`. Vậy `L = 1 + (m - 1) / g * g`.
5. Đáp án là giá trị lớn nhất trên mọi đoạn chạy.

## Ý tưởng triển khai
- Hai con trỏ `i`, `j`: `j` chạy tới hết đoạn cùng số dư với `nums[i]`, rồi `i = j`.
- `gcd` đệ quy một dòng; `gcd(0, k)` trả `k` đúng như cần.
- `(m - 1) / g * g` dùng phép chia nguyên của Swift để làm tròn xuống bội của `g`.
- Test cục bộ: đối chiếu vét cạn theo định nghĩa trên 8000 mảng ngẫu nhiên, và chạy thử `n = 10⁵`.

## Ví dụ chạy từng bước
**Input:** `nums = [2, 4, 6, 3]`, `k = 2`
**Output:** `3`

```
Số dư: [0, 0, 0, 1]
Đoạn 1: i=0, j=3 → r=0, m=3 → g = 2 / gcd(0, 2) = 2 / 2 = 1 → L = 1 + (2 / 1)·1 = 3 → best = 3
Đoạn 2: i=3, j=4 → r=1, m=1 → g = 2 / gcd(1, 2) = 2       → L = 1 + (0 / 2)·2 = 1
Kết quả: 3
```

**Input:** `nums = [1, 4, 7, 1]`, `k = 3`
**Output:** `4`

```
Số dư: [1, 1, 1, 1]
Đoạn 1: r=1, m=4 → g = 3 / gcd(1, 3) = 3 → L = 1 + (3 / 3)·3 = 4
```

**Input:** `nums = [2, 2, 2, 2, 2, 2]`, `k = 4` — ca mà đáp án ngắn hơn cả đoạn chạy
**Output:** `5`

```
Số dư: [2, 2, 2, 2, 2, 2]
Đoạn 1: r=2, m=6 → g = 4 / gcd(2, 4) = 2 → L = 1 + (5 / 2)·2 = 1 + 4 = 5
Kiểm tra: 5 số 2, bỏ một số còn 8 → chia hết cho 4 ✓
          6 số 2, bỏ một số còn 10 → không chia hết ✗
```

## Ghi nhớ
Bản "II" của một bài thường yêu cầu thay vòng lặp thử từng độ dài bằng một **công thức đóng**. Gặp `t·r ≡ 0 (mod k)` thì nhớ ngay: `t` là bội của `k / gcd(r, k)`.
