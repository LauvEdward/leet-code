---
id: 433
title: Minimum Genetic Mutation
slug: minimum-genetic-mutation
difficulty: Medium
topics: Graph BFS, Hash Table, String
date: 2026-10-22
time: O(B · L · 4)
space: O(B)
status: Chưa nộp (LeetCode trong Chrome chưa đăng nhập)
---
## Đề bài
Gen là chuỗi 8 ký tự trong `A C G T`. Một lần đột biến đổi đúng một ký tự, và gen sau đột biến phải nằm trong `bank`. Tìm số đột biến ít nhất từ `startGene` tới `endGene`, không được thì `-1`.

## Cơ sở lý thuyết
- **Đồ thị ngầm**: mỗi gen là một đỉnh; hai gen nối nhau khi khác đúng một ký tự (và gen đích nằm trong `bank`). Câu hỏi là đường đi ngắn nhất → BFS.
- **Sinh hàng xóm thay vì so từng cặp**: với mỗi vị trí thử 3 ký tự còn lại — chỉ `8 × 3 = 24` hàng xóm tiềm năng, rồi tra trong tập `bank`.
- **Xóa khỏi tập khi thăm**: gen đã vào hàng đợi thì xóa khỏi `left` để không thăm lại — tập `left` kiêm luôn vai trò "chưa thăm".

## Hướng xử lý
1. `endGene` không có trong `bank` → `-1`.
2. BFS theo tầng từ `startGene`; `steps` = số tầng đã đi.
3. Mỗi gen trong tầng: nếu bằng `endGene` → trả `steps`; ngược lại sinh mọi gen khác một ký tự, gen nào còn trong `left` thì xóa khỏi `left` và đưa vào tầng sau.
4. Hết → `-1`.

## Ý tưởng triển khai
- `var a = Array(g)`, đổi `a[i]` rồi trả lại `old` sau khi thử xong vị trí đó.
- `startGene` không cần nằm trong `bank` (đề cho phép).
- `startGene == endGene` → trả `0` ngay ở tầng đầu.

## Ví dụ chạy từng bước
**Input:** `startGene = "AACCGGTT"`, `endGene = "AAACGGTA"`, `bank = ["AACCGGTA", "AACCGCTA", "AAACGGTA"]`
**Output:** `2`

```
steps 0: tầng [AACCGGTT] — khác end
         hàng xóm có trong bank: AACCGGTA (đổi T→A ở vị trí 7)
steps 1: tầng [AACCGGTA] — khác end
         hàng xóm: AAACGGTA (C→A ở vị trí 2), AACCGCTA (G→C ở vị trí 5)
steps 2: tầng [AAACGGTA, AACCGCTA] — gặp AAACGGTA == end → trả 2
```

**Input:** `startGene = "AAAAAAAA"`, `endGene = "CCCCCCCC"`, `bank = ["AAAAAAAC", "CCCCCCCC"]` → **Output:** `-1` (từ `AAAAAAAC` không có bước nào trong `bank` để đi tiếp).

## Ghi nhớ
"Biến đổi từng bước nhỏ, mỗi trạng thái trung gian phải hợp lệ, tìm số bước ít nhất" → BFS trên đồ thị ngầm, sinh hàng xóm bằng cách thử mọi thay đổi một vị trí. Bài 127 là bản lớn hơn của cùng bài này.
