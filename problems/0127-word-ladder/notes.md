---
id: 127
title: Word Ladder
slug: word-ladder
difficulty: Hard
topics: Graph BFS, Hash Table, String
date: 2026-10-22
time: O(N · L · 26)
space: O(N · L)
status: Chưa nộp (LeetCode trong Chrome chưa đăng nhập)
---
## Đề bài
Biến `beginWord` thành `endWord` bằng cách mỗi bước đổi đúng một chữ cái, và mọi từ trung gian phải có trong `wordList`. Trả về **số từ** trong chuỗi biến đổi ngắn nhất (tính cả từ đầu và từ cuối), hoặc `0` nếu không làm được.

## Cơ sở lý thuyết
- Như bài 433: đồ thị ngầm giữa các từ khác nhau đúng một chữ, đường đi ngắn nhất → **BFS**.
- Danh sách tới 5000 từ: so mọi cặp từ để dựng cạnh là `O(N² · L)`. **Sinh hàng xóm** bằng cách thử 26 chữ ở mỗi vị trí chỉ tốn `O(L · 26)` mỗi từ, tra tập `O(L)`.
- **Xóa khỏi tập khi đưa vào hàng đợi** để mỗi từ chỉ vào hàng đợi một lần.
- Tối ưu thêm (không bắt buộc): BFS hai chiều từ cả hai đầu, luôn mở rộng phía nhỏ hơn.

## Hướng xử lý
1. `endWord` không có trong danh sách → `0`.
2. BFS theo tầng từ `beginWord`, `len = 1`.
3. Với mỗi từ trong tầng: bằng `endWord` → trả `len`; ngược lại sinh mọi từ khác một chữ, từ nào còn trong tập thì xóa và đưa vào tầng sau.
4. Sang tầng sau thì `len += 1`. Hết → `0`.

## Ý tưởng triển khai
- Khác bài 433 ở bảng chữ (26 chữ thường) và ở cách đếm: đếm **số từ** nên bắt đầu từ `1`.
- Test cục bộ có thêm một danh sách 5000 từ ngẫu nhiên để chắc lời giải đủ nhanh. (Lần đầu tôi sinh 5000 từ khác nhau dài 5 chỉ từ 5 chữ cái — trong khi chỉ có `5⁵ = 3125` từ như vậy — nên test treo; đã sửa thành 6 chữ cái.)

## Ví dụ chạy từng bước
**Input:** `beginWord = "hit"`, `endWord = "cog"`, `wordList = ["hot", "dot", "dog", "lot", "log", "cog"]`
**Output:** `5`

```
len 1: [hit]        → hàng xóm trong danh sách: hot
len 2: [hot]        → dot, lot
len 3: [dot, lot]   → từ dot: dog · từ lot: log
len 4: [dog, log]   → từ dog: cog (log → cog đã bị xóa khỏi tập, không thêm lần nữa)
len 5: [cog]        → bằng endWord → trả 5
Chuỗi: hit → hot → dot → dog → cog
```

**Input:** `wordList = ["hot", "dot", "dog", "lot", "log"]` (không có `cog`) → **Output:** `0`

## Ghi nhớ
Hai bài 433 và 127 cùng một khuôn: BFS + sinh hàng xóm + xóa khỏi tập khi thăm. Khi danh sách lớn, đừng dựng đồ thị đầy đủ — sinh cạnh khi cần.
