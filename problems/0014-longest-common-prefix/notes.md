---
id: 14
title: Longest Common Prefix
slug: longest-common-prefix
difficulty: Easy
topics: Array / String, Trie
date: 2026-10-13
time: O(tổng số ký tự)
space: O(độ dài chuỗi đầu)
status: Accepted
---
## Đề bài
Tìm tiền tố chung dài nhất của một mảng chuỗi; không có thì trả chuỗi rỗng.

## Cơ sở lý thuyết
- **Tiền tố chung chỉ có thể ngắn dần**: tiền tố chung của cả mảng là tiền tố của chuỗi đầu tiên, và mỗi chuỗi mới chỉ có thể làm nó ngắn lại. Đây là kiểu "thu hẹp ứng viên dần".
- Hai cách quét tương đương: **quét ngang** (so ứng viên với từng chuỗi, cắt bớt khi cần — dùng ở đây) và **quét dọc** (so từng cột ký tự trên mọi chuỗi).
- Chuỗi rỗng là tiền tố của mọi chuỗi, nên việc cắt chắc chắn dừng.

## Hướng xử lý
1. Lấy chuỗi đầu tiên làm ứng viên `p`.
2. Với mỗi chuỗi `s`: chừng nào `s` chưa bắt đầu bằng `p` thì bỏ ký tự cuối của `p`.
3. Trả về `p`.

## Ý tưởng triển khai
- `s.hasPrefix(p)` và `p.removeLast()`.
- Khi `p` thành rỗng: `hasPrefix("")` trả `true` nên vòng `while` dừng, không gọi `removeLast()` trên chuỗi rỗng (sẽ crash).
- Mỗi lần `hasPrefix` tốn `O(|p|)`, và `p` chỉ ngắn dần → tổng chi phí vẫn nhỏ.

## Ví dụ chạy từng bước
**Input:** `strs = ["flower", "flow", "flight"]`
**Output:** `"fl"`

```
p = "flower"
s = "flower": bắt đầu bằng "flower" ✓
s = "flow":   "flower" ✗ → "flowe" ✗ → "flow" ✓        p = "flow"
s = "flight": "flow" ✗ → "flo" ✗ → "fl" ✓              p = "fl"
Trả về "fl"
```

**Input:** `strs = ["dog", "racecar", "car"]`
**Output:** `""`

```
p = "dog"
s = "dog":     ✓
s = "racecar": "dog" ✗ → "do" ✗ → "d" ✗ → "" ✓         p = ""
s = "car":     "" ✓
Trả về ""
```

## Ghi nhớ
Bài "phần chung của nhiều thứ" → bắt đầu từ một ứng viên rồi thu hẹp. Nếu phải truy vấn tiền tố chung nhiều lần trên cùng tập chuỗi thì dùng Trie.
