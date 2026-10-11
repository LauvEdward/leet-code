---
id: 27
title: Remove Element
slug: remove-element
difficulty: Easy
topics: Array / String, Two Pointers
date: 2026-10-11
time: O(n)
space: O(1)
status: Accepted
---
## Đề bài
Xóa tại chỗ mọi phần tử bằng `val` khỏi `nums`. Trả về `k` — số phần tử còn lại; `k` ô đầu của `nums` phải chứa các phần tử đó (thứ tự tùy ý).

## Cơ sở lý thuyết
- **Hai con trỏ đọc/ghi (read/write)**: con trỏ đọc duyệt mọi phần tử, con trỏ ghi `k` chỉ vị trí kế tiếp của phần "giữ lại". Vì `k` không bao giờ vượt con trỏ đọc nên ghi đè là an toàn.
- Đây là thao tác **lọc tại chỗ** (in-place filter), nền tảng của các bài 26, 80, 283.

## Hướng xử lý
1. Duyệt từng phần tử `x`.
2. Nếu `x != val`: ghi vào `nums[k]`, tăng `k`.
3. Nếu `x == val`: bỏ qua.
4. Trả về `k`.

## Ý tưởng triển khai
- `for x in nums where x != val` — vòng `for` của Swift duyệt trên **bản sao** của mảng (value semantics), nên sửa `nums` bên trong vòng lặp không ảnh hưởng tới việc duyệt.
- Phần sau chỉ số `k` chứa gì cũng được, đề không kiểm tra.

## Ví dụ chạy từng bước
**Input:** `nums = [3, 2, 2, 3]`, `val = 3`
**Output:** `2`, `nums = [2, 2, _, _]`

```
x=3: bằng val → bỏ qua                          k=0
x=2: khác val → nums[0] = 2 → [2, 2, 2, 3]      k=1
x=2: khác val → nums[1] = 2 → [2, 2, 2, 3]      k=2
x=3: bằng val → bỏ qua                          k=2
Trả về 2; hai ô đầu là [2, 2]
```

**Input:** `nums = [0, 1, 2, 2, 3, 0, 4, 2]`, `val = 2` → **Output:** `5`

```
Giữ lần lượt 0, 1, 3, 0, 4 → nums = [0, 1, 3, 0, 4, _, _, _], k = 5
```

## Ghi nhớ
"Xóa tại chỗ, trả về độ dài mới" → con trỏ ghi `k`. Mẫu ba dòng này nên thuộc lòng.
