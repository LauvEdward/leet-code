---
id: 219
title: Contains Duplicate II
slug: contains-duplicate-ii
difficulty: Easy
topics: Hashmap, Array, Sliding Window
date: 2026-10-18
time: O(n)
space: O(n)
status: Chưa nộp (LeetCode trong Chrome chưa đăng nhập)
---
## Đề bài
Kiểm tra có hai chỉ số khác nhau `i`, `j` sao cho `nums[i] == nums[j]` và `|i - j| ≤ k` hay không.

## Cơ sở lý thuyết
- **Chỉ cần lần xuất hiện gần nhất**: khi gặp `nums[i]`, ứng viên tốt nhất để ghép là lần xuất hiện **gần nhất** trước đó của cùng giá trị — nếu cặp với lần gần nhất đã xa quá `k` thì mọi lần xa hơn càng không được.
- Bảng băm `giá trị → vị trí gần nhất`, cập nhật khi duyệt.
- Cách tương đương: cửa sổ trượt chứa `k` phần tử gần nhất trong một `Set`; gặp phần tử đã có trong cửa sổ là trả `true`.

## Hướng xử lý
1. Duyệt `i` từ trái sang phải.
2. Nếu `nums[i]` đã có vị trí gần nhất `j` và `i - j <= k` → `true`.
3. Cập nhật vị trí gần nhất của `nums[i]` thành `i`.
4. Duyệt hết → `false`.

## Ý tưởng triển khai
- `if let j = last[x], i - j <= k { return true }`.
- Luôn ghi đè `last[x] = i` sau khi kiểm tra, kể cả khi khoảng cách quá xa — vị trí mới gần hơn cho các lần sau.
- Test cục bộ đối chiếu với vét cạn mọi cặp.

## Ví dụ chạy từng bước
**Input:** `nums = [1, 2, 3, 1]`, `k = 3`
**Output:** `true`

```
i=0, x=1: chưa có → last = {1:0}
i=1, x=2: chưa có → last = {1:0, 2:1}
i=2, x=3: chưa có → last = {1:0, 2:1, 3:2}
i=3, x=1: last[1] = 0, 3 - 0 = 3 <= 3 → true
```

**Input:** `nums = [1, 2, 3, 1, 2, 3]`, `k = 2`
**Output:** `false`

```
i=0..2: ghi 1:0, 2:1, 3:2
i=3, x=1: 3 - 0 = 3 > 2 → không, cập nhật last[1] = 3
i=4, x=2: 4 - 1 = 3 > 2 → không, cập nhật last[2] = 4
i=5, x=3: 5 - 2 = 3 > 2 → không, cập nhật last[3] = 5
Hết → false
```

## Ghi nhớ
"Hai phần tử bằng nhau trong khoảng cách `k`" → nhớ vị trí gần nhất (hoặc cửa sổ `k` phần tử). Bài 220 (giá trị gần nhau thay vì bằng nhau) cần thêm cấu trúc có thứ tự hoặc chia xô.
