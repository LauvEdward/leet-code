---
id: 4063
title: Longest Subarray Divisible by K with At Most One Negation I
slug: longest-subarray-divisible-by-k-with-at-most-one-negation-i
difficulty: Medium
topics: Biweekly Contest 192, Array, Hash Table, Math, Enumeration
date: 2026-10-09
time: O(n²)
space: O(k)
status: Accepted
---
## Đề bài
Cho mảng `nums` (`n ≤ 1000`) và số `k`. Một mảng con là hợp lệ nếu tổng của nó chia hết cho `k`, hoặc trở nên chia hết cho `k` sau khi đổi dấu **một** phần tử trong nó. Tìm độ dài mảng con hợp lệ dài nhất (không có thì trả `0`).

## Cơ sở lý thuyết
- **Đồng dư**: `a ≡ b (mod k)` khi `a - b` chia hết cho `k`. Phép cộng, trừ, nhân đều "đi qua" được phép lấy dư.
- **Tác động của việc đổi dấu**: đổi `x` thành `-x` làm tổng giảm đúng `2x`. Vậy điều kiện "đổi dấu một phần tử thì chia hết" tương đương: tồn tại `x` trong mảng con sao cho `S - 2x ≡ 0`, tức `2x ≡ S (mod k)`.
- **Phép `%` với số âm trong Swift** cho kết quả âm (`-7 % 3 == -1`). Muốn dư không âm phải chuẩn hóa: `((x % k) + k) % k`.
- **Mảng đánh dấu theo "tem" (timestamp)**: thay vì xóa cả mảng `seen` mỗi vòng ngoài (tốn `O(k)`), ghi vào ô số hiệu của vòng hiện tại. Ô chỉ được coi là "đã đánh dấu" khi tem trùng vòng đang xét.

## Hướng xử lý
1. `n ≤ 1000` nên `O(n²)` — xét mọi cặp `(l, r)` — là đủ, miễn mỗi cặp kiểm tra trong `O(1)`.
2. Cố định `l`, mở rộng `r` dần. Duy trì:
   - `sum` = tổng đoạn `[l, r]` theo modulo `k`.
   - Tập các giá trị `2x mod k` của những phần tử đã nằm trong đoạn.
3. Đoạn `[l, r]` hợp lệ khi `sum == 0` (không cần đổi dấu) hoặc `sum` nằm trong tập trên (đổi dấu phần tử tương ứng).

## Ý tưởng triển khai
- `seen` là mảng `k` ô, khởi tạo `-1`; `seen[v] = l` nghĩa là "trong vòng `l`, đã có phần tử cho `2x ≡ v`". Kiểm tra bằng `seen[sum] == l`.
- Chuẩn hóa dư không âm ở cả `sum` và `2 * nums[r]`.
- Phải thêm `nums[r]` vào tập **trước** khi kiểm tra, vì chính phần tử mới cũng có thể là phần tử bị đổi dấu.
- Test cục bộ đối chiếu với vét cạn `O(n³)` trên 5000 mảng ngẫu nhiên, có cả số âm.

## Ví dụ chạy từng bước
**Input:** `nums = [4, 1, 2]`, `k = 3`
**Output:** `3`

Vòng ngoài `l = 0` (các vòng `l = 1, 2` không cho kết quả dài hơn):

```
r=0, x=4: sum = 4 % 3 = 1          đánh dấu seen[2·4 % 3 = 2] = 0
          sum ≠ 0, seen[1] chưa đánh dấu → [4] không hợp lệ

r=1, x=1: sum = (1 + 1) % 3 = 2    đánh dấu seen[2·1 % 3 = 2] = 0
          seen[2] == 0 → hợp lệ → best = 2
          (đổi dấu 1: 4 - 1 = 3 chia hết cho 3)

r=2, x=2: sum = (2 + 2) % 3 = 1    đánh dấu seen[2·2 % 3 = 1] = 0
          seen[1] == 0 → hợp lệ → best = 3
          (đổi dấu 2: 4 + 1 - 2 = 3 chia hết cho 3)
```

**Input:** `nums = [5, 3, 4]`, `k = 7` → **Output:** `2`

```
l=0: [5] sum=5 ✗ · [5,3] sum=1, các 2x%7 = {3, 6} ✗ · [5,3,4] sum=5, {3, 6, 1} ✗
l=1: [3] sum=3 ✗ · [3,4] sum = 7 % 7 = 0 ✓ → best = 2
l=2: [4] sum=4, 2x%7 = 1 ✗
```

## Ghi nhớ
"Sửa một phần tử thì tổng thỏa điều kiện" → viết ra tổng thay đổi bao nhiêu (ở đây `-2x`) và chuyển thành câu hỏi "có phần tử nào mang giá trị cần thiết không". Bản II (4064) có `n = 10⁵` nên phải bỏ vòng lặp theo `l` — xem ghi chú bài đó.
