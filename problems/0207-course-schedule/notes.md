---
id: 207
title: Course Schedule
slug: course-schedule
difficulty: Medium
topics: Graph General, Topological Sort, BFS, DFS
date: 2026-10-21
time: O(V + E)
space: O(V + E)
status: Chưa nộp (LeetCode trong Chrome chưa đăng nhập)
---
## Đề bài
Có `numCourses` môn học; mỗi cặp `[a, b]` nghĩa là phải học `b` trước `a`. Hỏi có thể học hết các môn không.

## Cơ sở lý thuyết
- Mô hình: **đồ thị có hướng** với cạnh `b → a`. Học được hết ⟺ đồ thị **không có chu trình** (DAG) ⟺ tồn tại **thứ tự tô-pô**.
- **Thuật toán Kahn**: liên tục lấy ra đỉnh có **bậc vào bằng 0** (môn không còn điều kiện chưa thỏa), "học" nó và giảm bậc vào của các môn phụ thuộc. Nếu cuối cùng lấy ra được đủ mọi đỉnh → không có chu trình. Các đỉnh trên một chu trình không bao giờ về bậc vào 0.
- Cách khác: DFS ba màu (trắng/xám/đen) — gặp cạnh tới đỉnh xám là có chu trình (dùng trong test cục bộ).

## Hướng xử lý
1. Dựng danh sách kề `b → a` và mảng bậc vào.
2. Đưa mọi đỉnh có bậc vào 0 vào hàng chờ.
3. Lấy dần ra, đếm `done`; giảm bậc vào của hàng xóm, đỉnh nào về 0 thì đưa vào hàng chờ.
4. Trả `done == numCourses`.

## Ý tưởng triển khai
- Dùng mảng làm ngăn xếp (`popLast`) thay cho hàng đợi: thứ tự lấy ra khác nhưng vẫn là một thứ tự tô-pô hợp lệ, và tránh `removeFirst` `O(n)`.
- Cạnh tự vòng `[0, 0]` làm bậc vào của `0` không bao giờ về 0 → đúng là không học được.
- Test cục bộ: so với DFS ba màu trên 3000 đồ thị ngẫu nhiên.

## Ví dụ chạy từng bước
**Input:** `numCourses = 2`, `prerequisites = [[1, 0]]`
**Output:** `true`

```
Cạnh 0 → 1, bậc vào = [0, 1]
Hàng chờ: [0]
Lấy 0 → done = 1; bậc vào của 1 giảm còn 0 → đưa 1 vào
Lấy 1 → done = 2
done == 2 → true
```

**Input:** `numCourses = 2`, `prerequisites = [[1, 0], [0, 1]]`
**Output:** `false`

```
Cạnh 0 → 1 và 1 → 0, bậc vào = [1, 1]
Không đỉnh nào có bậc vào 0 → hàng chờ rỗng → done = 0 ≠ 2 → false
```

## Ghi nhớ
"Có thể làm hết theo điều kiện tiên quyết không / thứ tự nào hợp lệ" → sắp xếp tô-pô (Kahn). Bài 210 trả về luôn thứ tự đó.
