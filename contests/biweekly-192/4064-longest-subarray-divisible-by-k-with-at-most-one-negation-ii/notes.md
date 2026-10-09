---
id: 4064
title: Longest Subarray Divisible by K with At Most One Negation II
slug: longest-subarray-divisible-by-k-with-at-most-one-negation-ii
difficulty: Hard
topics: Biweekly Contest 192, Array, Prefix Sum, Hash Table, Math
date: 2026-10-09
time: O(n + k²)
space: O(k)
status: Accepted
---
## Đề bài
Giống bài I (4063): mảng con hợp lệ nếu tổng chia hết cho `k`, hoặc chia hết sau khi đổi dấu một phần tử trong nó; tìm độ dài lớn nhất. Khác ở ràng buộc: `n ≤ 10⁵`, `k ≤ 3000`.

## Cơ sở lý thuyết
- **Tổng tiền tố theo modulo**: đặt `P[l]` là tổng `l` phần tử đầu. Tổng đoạn `[l, r]` là `P[r+1] - P[l]`, chia hết cho `k` khi `P[r+1] ≡ P[l]`. Muốn đoạn dài nhất → với mỗi số dư chỉ cần nhớ **vị trí xuất hiện sớm nhất** (`first[u]`). Đây là kỹ thuật của bài 974 / 523.
- **Đổi dấu `nums[i]`** làm tổng giảm `2·nums[i]`, nên điều kiện thành: tồn tại `l ≤ i ≤ r` với `P[l] + 2·nums[i] ≡ P[r+1] (mod k)`.
- **Ràng buộc gợi ý độ phức tạp**: `k ≤ 3000` nhỏ bất thường → lời giải mong đợi phụ thuộc vào `k`, cỡ `O(k²)` (9 triệu) chứ không phải `O(n·k)` (300 triệu).
- **Cập nhật lười (lazy)**: hoãn việc tính cho tới khi thật sự cần, và không bao giờ làm lại phần đã làm.

## Hướng xử lý
1. `O(n²)` của bài I không còn dùng được. Duyệt `r` từ trái sang phải và cần trả lời nhanh: `l` nhỏ nhất thỏa điều kiện là bao nhiêu?
2. Trường hợp không đổi dấu: `l = first[P[r+1]]`.
3. Trường hợp đổi dấu: định nghĩa `e[v]` = `l` nhỏ nhất sao cho có `i ≥ l` **đã duyệt** với `(P[l] + 2·nums[i]) mod k = v`. Đáp án tại `r` là `e[P[r+1]]`.
4. **Cập nhật `e` khi thêm phần tử `i = r`**: nó ghép được với mọi `l ≤ r`, nhưng với mỗi số dư `u` chỉ `l` sớm nhất có ích, nên `e[(u + s) mod k] = min(…, first[u])` với `s = 2·nums[r] mod k`, cho mọi số dư `u` đã xuất hiện. Làm thẳng như vậy tốn `O(k)` mỗi bước → `O(n·k)`, sát giới hạn.
5. **Tối ưu then chốt.** Phép cập nhật chỉ phụ thuộc vào cặp `(độ dịch s, số dư u)`, và `first[u]` **không bao giờ thay đổi** sau khi được gán. Vậy mỗi cặp `(s, u)` chỉ cần xử lý **một lần duy nhất**. Khi gặp lại độ dịch `s`, chỉ cần ghép với những số dư **mới xuất hiện** kể từ lần trước. Tổng công việc bị chặn bởi số cặp: `k × k`.
6. Vì sao hoãn mà vẫn đúng: số dư `u` xuất hiện lần đầu ở vị trí `l` chỉ ghép được với phần tử `i ≥ l`. Nếu sau thời điểm đó độ dịch `s` không xuất hiện nữa thì cặp `(s, u)` vốn không hợp lệ, bỏ qua là đúng.

## Ý tưởng triển khai
- `first[u]` (khởi tạo `first[0] = 0` cho tiền tố rỗng), `order` là danh sách số dư theo thứ tự xuất hiện lần đầu.
- `done[s]` = số phần tử đầu của `order` đã được ghép với độ dịch `s`. Tại mỗi `r`: chạy `t` từ `done[s]` tới hết `order`, cập nhật `e`, rồi đặt `done[s] = order.count`.
- **Thứ tự trong một bước** quan trọng: (1) cập nhật `e` bằng `nums[r]` với các tiền tố `P[0…r]`; (2) tính `p = P[r+1]`; (3) truy vấn `min(first[p], e[p])`; (4) sau cùng mới thêm `P[r+1]` vào `first`/`order`. Thêm sớm hơn sẽ cho phép `l = r + 1`, tức mảng con rỗng.
- Chuẩn hóa dư không âm bằng `((x % k) + k) % k` vì `nums` có số âm.
- Test cục bộ: đối chiếu vét cạn trên 20.000 mảng ngẫu nhiên nhỏ, và chạy thử `n = 10⁵`, `k = 3000` để chắc không quá chậm.

## Ghi nhớ
Khi một phép cập nhật lặp lại chỉ phụ thuộc vào một cặp tham số rời rạc và dữ liệu nền chỉ **được thêm vào, không bị sửa**, hãy nhớ "đã xử lý tới đâu" cho từng tham số — tổng chi phí bị chặn bởi số cặp thay vì số bước. Và luôn nhìn ràng buộc: tham số nào nhỏ bất thường thì độ phức tạp được phép bình phương theo nó.
