---
id: 193002
title: Longest Resilient Subarray I
slug: longest-resilient-subarray-i
difficulty: Medium
topics: Biweekly Contest 193, Array, Math, Enumeration
date: 2026-10-11
time: O(n²)
space: O(1)
status: Chưa nộp (bài chưa mở ngoài trang contest)
---
## Đề bài
Cho mảng số dương `nums` (`n ≤ 2500`) và `k`. Một mảng con là *resilient* nếu xóa **bất kỳ** phần tử nào của nó thì tổng phần còn lại vẫn chia hết cho `k` (mảng con dài 1 luôn thỏa). Tìm độ dài mảng con resilient dài nhất.

## Cơ sở lý thuyết
- **Đồng dư**: `a ≡ b (mod k)` khi `a - b` chia hết cho `k`.
- **Biến điều kiện "với mọi phần tử" thành điều kiện cấu trúc**: gọi tổng mảng con là `S`. Yêu cầu `S - x ≡ 0` với mọi `x` trong mảng con nghĩa là mọi `x ≡ S (mod k)` — tức **mọi phần tử có cùng số dư** `r` khi chia cho `k`.
- Khi mọi phần tử cùng dư `r` và mảng con dài `L`: `S ≡ L·r`, bỏ một phần tử còn `(L - 1)·r`. Vậy điều kiện là **`(L - 1)·r ≡ 0 (mod k)`**.

## Hướng xử lý
1. Từ định nghĩa suy ra hai điều kiện cần và đủ: (a) mọi phần tử cùng số dư `r`; (b) `(L - 1)·r` chia hết cho `k`.
2. `n ≤ 2500` nên thử mọi điểm đầu `l` rồi mở rộng `r` là đủ (`≈ 6 × 10⁶` bước).
3. Cố định `l`, lấy `r0 = nums[l] % k`. Mở rộng sang phải; gặp phần tử khác số dư thì dừng hẳn (mọi đoạn dài hơn đều hỏng điều kiện a).
4. Ở mỗi độ dài `len`, nếu `(len - 1)·r0 % k == 0` thì cập nhật đáp án. Không dừng khi điều kiện (b) sai — độ dài lớn hơn vẫn có thể thỏa.

## Ý tưởng triển khai
- `best = 1` ngay từ đầu vì mảng con dài 1 luôn hợp lệ.
- Không cần tính tổng thật: chỉ cần `len` và `r0`.
- `(len - 1) * r0` tối đa cỡ `2500 × 10⁵`, không lo tràn.
- Test cục bộ đối chiếu với vét cạn làm đúng theo định nghĩa (thử xóa từng phần tử) trên 8000 mảng ngẫu nhiên.

## Ví dụ chạy từng bước
**Input:** `nums = [5, 5, 4, 8]`, `k = 4`
**Output:** `2`

Số dư của từng phần tử: `[1, 1, 0, 0]`.

```
l=0, r0=1: r=0 → len=1: (0·1) % 4 = 0 ✓ → best = 1
           r=1 → dư 1 ✓, len=2: (1·1) % 4 = 1 ✗
           r=2 → dư 0 ≠ 1 → dừng
l=1, r0=1: r=1 → len=1 ✓
           r=2 → dư 0 ≠ 1 → dừng
l=2, r0=0: r=2 → len=1 ✓
           r=3 → dư 0 ✓, len=2: (1·0) % 4 = 0 ✓ → best = 2
l=3, r0=0: r=3 → len=1 ✓
Kết quả: 2   (mảng con [4, 8]: xóa 4 còn 8, xóa 8 còn 4)
```

**Input:** `nums = [1, 4, 7, 1]`, `k = 3` → **Output:** `4`

```
Số dư: [1, 1, 1, 1], l=0, r0=1
len=1: 0 % 3 = 0 ✓ · len=2: 1 % 3 ✗ · len=3: 2 % 3 ✗ · len=4: 3 % 3 = 0 ✓ → best = 4
```

Ví dụ này cho thấy vì sao không được dừng khi điều kiện (b) sai ở `len = 2`.

## Ghi nhớ
Điều kiện dạng "với **mọi** phần tử bị xóa/đổi, tính chất vẫn giữ" thường ép các phần tử phải giống nhau theo một nghĩa nào đó (ở đây: cùng số dư). Viết điều kiện cho hai phần tử bất kỳ rồi trừ vế cho nhau là thấy ngay. Bản II (`n = 10⁵`) dùng đúng nhận xét này nhưng tính trực tiếp trên từng đoạn.
