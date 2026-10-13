---
id: 392
title: Is Subsequence
slug: is-subsequence
difficulty: Easy
topics: Two Pointers, String, Dynamic Programming
date: 2026-10-13
time: O(|t|)
space: O(|s|)
status: Accepted
---
## Đề bài
Kiểm tra `s` có phải là **dãy con** của `t` không — tức có thể xóa bớt một số ký tự của `t` (giữ nguyên thứ tự) để được `s`.

## Cơ sở lý thuyết
- **Dãy con (subsequence)** khác **chuỗi con (substring)**: không cần liên tiếp, chỉ cần đúng thứ tự.
- **Tham lam khớp sớm nhất**: khi cần ký tự `s[i]`, hãy khớp nó với lần xuất hiện **đầu tiên** còn lại trong `t`. Khớp sớm không bao giờ thiệt — nó để lại nhiều ký tự nhất cho phần sau (lập luận đổi chỗ).
- Câu hỏi mở rộng của đề (rất nhiều chuỗi `s` trên cùng một `t`): lưu danh sách vị trí của từng ký tự trong `t` rồi tìm nhị phân vị trí kế tiếp.

## Hướng xử lý
1. Con trỏ `i` trên `s`, ban đầu `0`.
2. Duyệt từng ký tự `c` của `t`: nếu `c == s[i]` thì `i += 1`.
3. Kết thúc: `s` là dãy con khi và chỉ khi `i` đã đi hết `s`.

## Ý tưởng triển khai
- `for c in t where i < a.count && c == a[i]` — điều kiện `i < a.count` đứng trước để không truy cập ngoài mảng khi đã khớp hết.
- `s` rỗng → `i == 0 == a.count` → `true`.
- Test cục bộ: vét cạn mọi dãy con của `t` (độ dài ≤ 8) để đối chiếu.

## Ví dụ chạy từng bước
**Input:** `s = "abc"`, `t = "ahbgdc"`
**Output:** `true`

```
i=0 (cần 'a')
c='a': khớp → i=1 (cần 'b')
c='h': không
c='b': khớp → i=2 (cần 'c')
c='g': không
c='d': không
c='c': khớp → i=3
i == 3 == độ dài s → true
```

**Input:** `s = "axc"`, `t = "ahbgdc"`
**Output:** `false`

```
c='a': khớp → i=1 (cần 'x')
c='h', 'b', 'g', 'd', 'c': không có 'x'
i == 1 ≠ 3 → false
```

## Ghi nhớ
"Dãy con" + chỉ hỏi có/không → hai con trỏ tham lam, `O(n)`. Chỉ cần DP khi phải **đếm** số cách hoặc tìm dãy con chung dài nhất.
