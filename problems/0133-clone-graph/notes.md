---
id: 133
title: Clone Graph
slug: clone-graph
difficulty: Medium
topics: Graph General, DFS, BFS, Hash Table
date: 2026-10-21
time: O(V + E)
space: O(V)
status: Chưa nộp (LeetCode trong Chrome chưa đăng nhập)
---
## Đề bài
Cho một nút của đồ thị vô hướng liên thông (mỗi nút có `val` và danh sách `neighbors`). Trả về bản sao sâu của cả đồ thị.

## Cơ sở lý thuyết
- Đồ thị có **chu trình** (cạnh vô hướng nghĩa là `A` có `B` làm hàng xóm và ngược lại), nên duyệt ngây thơ sẽ lặp vô hạn.
- **Bảng ánh xạ cũ → mới** đóng hai vai: vừa đánh dấu nút đã thăm, vừa cho biết bản sao đã tạo để nối cạnh. Cùng ý tưởng với bài 138 (Copy List with Random Pointer).
- **Ghi vào bảng trước khi đệ quy sang hàng xóm**: khi vòng quay lại nút đang được sao chép, ta lấy được bản sao (dù danh sách hàng xóm của nó chưa xong) thay vì tạo bản sao thứ hai.

## Hướng xử lý
1. `clone(n)`: `n` rỗng → `nil`; đã có bản sao → trả bản sao.
2. Tạo `c = Node(n.val)`, ghi `copies[n] = c`.
3. Với mỗi hàng xóm `nb` của `n`: thêm `clone(nb)` vào `c.neighbors`.
4. Trả `c`.

## Ý tưởng triển khai
- Khóa là `ObjectIdentifier(n)` — danh tính nút, vì giá trị có thể trùng nhau ở bài khác.
- `copies` là thuộc tính của lớp để mọi lời gọi đệ quy dùng chung.
- Đồ thị chỉ tối đa 100 nút nên đệ quy không sâu.
- Test cục bộ: duyệt song song đồ thị gốc và bản sao, kiểm tra không nút nào bị dùng lại, giá trị và số hàng xóm khớp, và cấu trúc giống nhau.

## Ví dụ chạy từng bước
**Input:** `adjList = [[2, 4], [1, 3], [2, 4], [1, 3]]` (vòng 1 – 2 – 3 – 4 – 1)
**Output:** đồ thị giống hệt, toàn nút mới

```
clone(1): tạo 1', ghi {1}
   hàng xóm 2 → clone(2): tạo 2', ghi {1, 2}
      hàng xóm 1 → đã có → 1'                  2'.neighbors = [1']
      hàng xóm 3 → clone(3): tạo 3', ghi {1, 2, 3}
         hàng xóm 2 → đã có → 2'               3'.neighbors = [2']
         hàng xóm 4 → clone(4): tạo 4'
            hàng xóm 1 → 1', hàng xóm 3 → 3'   4'.neighbors = [1', 3']
                                               3'.neighbors = [2', 4']
                                               2'.neighbors = [1', 3']
   hàng xóm 4 → đã có → 4'                     1'.neighbors = [2', 4']
Trả về 1'
```

**Input:** `adjList = []` → **Output:** `[]` (nút rỗng).

## Ghi nhớ
Sao chép cấu trúc có chu trình → bảng "cũ → mới" + ghi vào bảng **trước** khi đi sang hàng xóm.
