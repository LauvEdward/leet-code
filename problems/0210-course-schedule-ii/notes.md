---
id: 210
title: Course Schedule II
slug: course-schedule-ii
difficulty: Medium
topics: Graph General, Topological Sort, BFS
date: 2026-10-21
time: O(V + E)
space: O(V + E)
status: Chưa nộp (LeetCode trong Chrome chưa đăng nhập)
---
## Đề bài
Như bài 207, nhưng trả về **một thứ tự học** hợp lệ cho mọi môn; nếu không thể thì trả mảng rỗng.

## Cơ sở lý thuyết
- **Thứ tự tô-pô**: một cách xếp các đỉnh sao cho mọi cạnh `u → v` đều có `u` đứng trước `v`. Thuật toán Kahn sinh ra đúng một thứ tự như vậy — chính là thứ tự các đỉnh được lấy ra.
- Có thể có **nhiều** thứ tự hợp lệ; đề chấp nhận bất kỳ thứ tự nào.
- Nếu đồ thị có chu trình, Kahn dừng sớm với ít hơn `n` đỉnh.

## Hướng xử lý
1. Như bài 207, nhưng mỗi đỉnh lấy ra được thêm vào `order`.
2. `order` đủ `numCourses` phần tử → trả `order`; ngược lại → `[]`.

## Ý tưởng triển khai
- Khác bài 207 đúng một dòng: `order.append(c)` thay cho `done += 1`.
- Test cục bộ: kiểm tra thứ tự trả về là hoán vị của `0…n-1` và mọi điều kiện tiên quyết đứng trước; khi đồ thị có chu trình thì phải trả mảng rỗng.

## Ví dụ chạy từng bước
**Input:** `numCourses = 4`, `prerequisites = [[1, 0], [2, 0], [3, 1], [3, 2]]`
**Output:** `[0, 2, 1, 3]` (hoặc `[0, 1, 2, 3]`, đều hợp lệ)

```
Cạnh: 0 → 1, 0 → 2, 1 → 3, 2 → 3
Bậc vào = [0, 1, 1, 2]
Hàng chờ: [0]
Lấy 0: order = [0]          bậc vào 1 → 0, 2 → 0   hàng chờ [1, 2]
Lấy 2: order = [0, 2]       bậc vào 3 → 1          hàng chờ [1]
Lấy 1: order = [0, 2, 1]    bậc vào 3 → 0          hàng chờ [3]
Lấy 3: order = [0, 2, 1, 3]
Đủ 4 môn → trả về [0, 2, 1, 3]
```

**Input:** `numCourses = 2`, `prerequisites = [[0, 1], [1, 0]]` → **Output:** `[]` (có chu trình).

## Ghi nhớ
Kahn cho cả hai câu trả lời: "có làm được không" (đếm) và "làm theo thứ tự nào" (ghi lại). Lấy từ ngăn xếp hay hàng đợi đều ra thứ tự hợp lệ.
