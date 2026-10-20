---
id: 100
title: Same Tree
slug: same-tree
difficulty: Easy
topics: Binary Tree General, DFS
date: 2026-10-20
time: O(n)
space: O(h)
status: Chưa nộp (LeetCode trong Chrome chưa đăng nhập)
---
## Đề bài
Kiểm tra hai cây nhị phân có giống hệt nhau không (cùng cấu trúc và cùng giá trị tại mọi nút).

## Cơ sở lý thuyết
- **Đệ quy song song trên hai cây**: hai cây giống nhau khi gốc bằng nhau, hai cây con trái giống nhau và hai cây con phải giống nhau.
- Ca cơ sở cần phân biệt: cả hai rỗng → giống; đúng một cây rỗng → khác.

## Hướng xử lý
1. Cả hai `nil` → `true`.
2. Một trong hai `nil` → `false`.
3. So giá trị gốc, rồi đệ quy cho cặp con trái và cặp con phải.

## Ý tưởng triển khai
- `guard let a = p, let b = q else { return false }` đặt sau dòng kiểm tra "cả hai nil" — khi tới đây mà còn optional nào `nil` thì chắc chắn chỉ một bên rỗng.
- `&&` ngắn mạch: gặp chỗ khác là dừng, không duyệt tiếp.
- Test cục bộ: so với việc so sánh mảng theo tầng của hai cây.

## Ví dụ chạy từng bước
**Input:** `p = [1, 2]`, `q = [1, null, 2]`
**Output:** `false`

```
So gốc: 1 == 1 ✓
So con trái: p.left = 2, q.left = nil → một bên rỗng → false
(dừng luôn nhờ &&, không xét con phải)
```

**Input:** `p = [1, 2, 3]`, `q = [1, 2, 3]` → **Output:** `true`

```
gốc 1 == 1 · trái: 2 == 2, hai con đều nil ✓ · phải: 3 == 3, hai con đều nil ✓
```

## Ghi nhớ
So sánh hai cây → đệ quy trên cặp nút, ba ca cơ sở (nil/nil, nil/khác nil, so giá trị). Bài 101 dùng đúng khuôn này nhưng ghép chéo trái–phải.
