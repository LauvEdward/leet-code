---
id: 4072
title: Maximum Alternating Subarray Sum With One Deletion
slug: maximum-alternating-subarray-sum-with-one-deletion
difficulty: Medium
topics: Weekly Contest 522, Array, Dynamic Programming
date: 2026-10-09
time: O(n)
space: O(1)
status: Accepted
---
## Đề bài
Cho mảng `nums`. Được xóa tối đa một phần tử, sau đó chọn một mảng con (liên tiếp) của mảng còn lại. Tổng đan dấu của mảng con là `b[0] - b[1] + b[2] - …` (đánh số lại từ 0). Tìm tổng đan dấu lớn nhất.

## Cơ sở lý thuyết
- **Kadane mở rộng**: bài "mảng con có tổng lớn nhất" giải bằng DP `best[i]` = tổng lớn nhất của mảng con **kết thúc tại** `i`. Khi bài có thêm ràng buộc, ta thêm chiều trạng thái thay vì đổi thuật toán.
- **DP theo trạng thái (state machine DP)**: mỗi trạng thái ghi lại đúng những gì cần biết để đi tiếp. Ở đây cần hai thông tin:
   - **Dấu** của phần tử cuối (`+` hay `-`), vì nó quyết định dấu của phần tử kế tiếp.
   - **Đã dùng quyền xóa chưa** (0 hoặc 1).
- Cùng họ với bài 1186 (Maximum Subarray Sum with One Deletion) và 1911 (Maximum Alternating Subsequence Sum).

## Hướng xử lý
Gọi các trạng thái tại vị trí `i` (mảng con bắt buộc kết thúc ở `nums[i]`):
- `p0` / `m0`: chưa xóa, phần tử cuối mang dấu `+` / `-`.
- `p1` / `m1`: đã xóa một phần tử, phần tử cuối mang dấu `+` / `-`.

Chuyển trạng thái với `x = nums[i]`:
1. `p0 = max(x, m0_trước + x)` — bắt đầu mảng con mới tại `x`, hoặc nối sau một phần tử mang dấu `-`.
2. `m0 = p0_trước - x`.
3. `p1 = max(m1_trước, m0_trước_nữa) + x` — hoặc đã xóa từ trước rồi nối bình thường, hoặc **xóa ngay phần tử `i - 1`** và nối `x` vào mảng con kết thúc ở `i - 2`.
4. `m1 = max(p1_trước, p0_trước_nữa) - x` — tương tự.

Chỉ cần xét việc xóa phần tử **nằm giữa** mảng con: xóa ở ngoài hoặc ở hai đầu không khác gì chọn mảng con khác mà không xóa.

Đáp án là giá trị lớn nhất của cả bốn trạng thái trên mọi vị trí.

## Ý tưởng triển khai
- Sáu biến vô hướng: bốn trạng thái hiện tại và `pp0`, `pm0` là `p0`, `m0` của vị trí trước đó nữa.
- `NEG = Int.min / 2` làm "âm vô cùng" — chia đôi để cộng trừ thêm không bị tràn (Swift crash khi tràn số).
- Tính bốn giá trị mới vào biến tạm rồi mới gán, tránh dùng nhầm giá trị đã cập nhật.
- Test cục bộ đối chiếu với vét cạn (thử xóa từng phần tử, thử mọi mảng con) trên 5000 mảng ngẫu nhiên.

## Ví dụ chạy từng bước
**Input:** `nums = [10, -5, -100]`
**Output:** `110` (xóa `-5`, chọn `[10, -100]` → `10 - (-100)`)

Ký hiệu `-∞` là "chưa có trạng thái". `pp0`, `pm0` là `p0`, `m0` của vị trí trước đó nữa.

```
Khởi tạo: p0 = m0 = p1 = m1 = -∞, pp0 = pm0 = -∞

x = 10:
   p0 = max(10, m0 + 10)        = 10      mảng con [10]
   m0 = p0_cũ - 10              = -∞
   p1 = max(m1, pm0) + 10       = -∞
   m1 = max(p1, pp0) - 10       = -∞
   best = 10

x = -5:   (pp0 = -∞, pm0 = -∞ lấy từ trước bước x = 10)
   p0 = max(-5, m0 + (-5))      = -5      mảng con [-5]
   m0 = p0_cũ - (-5) = 10 + 5   = 15      mảng con [10, -5]
   p1 = max(m1, pm0) + (-5)     = -∞
   m1 = max(p1, pp0) - (-5)     = -∞
   best = 15

x = -100: (pp0 = 10, pm0 = -∞ là p0, m0 sau bước x = 10)
   p0 = max(-100, 15 - 100)     = -85     mảng con [10, -5, -100]
   m0 = -5 + 100                = 95      mảng con [-5, -100]
   p1 = max(m1, pm0) - 100      = -∞
   m1 = max(p1, pp0) + 100      = 10 + 100 = 110   xóa -5, nối -100 sau [10]
   best = 110
```

**Input:** `nums = [5, -5, 1]` → **Output:** `11` — không xóa gì: `5 - (-5) + 1`, đến từ trạng thái `p0` ở bước cuối (`m0 + 1 = 10 + 1`).

## Ghi nhớ
"Mảng con tối ưu + được phép làm X tối đa một lần" → Kadane với thêm một chiều "đã dùng X chưa". Khi thao tác là *xóa*, nhớ trạng thái của vị trí `i - 2` để nối qua phần tử bị xóa.
