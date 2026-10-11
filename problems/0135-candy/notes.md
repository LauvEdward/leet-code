---
id: 135
title: Candy
slug: candy
difficulty: Hard
topics: Array / String, Greedy
date: 2026-10-11
time: O(n)
space: O(n)
status: Accepted
---
## Đề bài
`n` đứa trẻ đứng thành hàng, mỗi đứa có điểm `ratings[i]`. Phát kẹo sao cho mỗi đứa có ít nhất 1 viên, và đứa có điểm cao hơn **bạn đứng kề** phải được nhiều kẹo hơn bạn đó. Tìm tổng số kẹo ít nhất.

## Cơ sở lý thuyết
- **Tách ràng buộc hai phía thành hai lượt một phía**: ràng buộc "hơn bạn bên trái" chỉ nhìn về trái nên giải được bằng một lượt trái → phải; ràng buộc "hơn bạn bên phải" giải bằng một lượt phải → trái.
- **Gộp bằng `max`**: mỗi lượt cho ra số kẹo **nhỏ nhất** thỏa một phía. Số kẹo nhỏ nhất thỏa cả hai phía là `max` của hai kết quả — lấy `max` không phá ràng buộc nào, vì giá trị chỉ tăng ở đứa cần nhiều hơn.
- Về bản chất, số kẹo của mỗi đứa là độ dài dãy tăng nghiêm ngặt dài nhất kết thúc tại nó, tính từ mỗi phía.

## Hướng xử lý
1. Khởi tạo mỗi đứa 1 viên.
2. Lượt trái → phải: nếu `ratings[i] > ratings[i-1]` thì `c[i] = c[i-1] + 1`.
3. Lượt phải → trái: nếu `ratings[i] > ratings[i+1]` thì `c[i] = max(c[i], c[i+1] + 1)`.
4. Trả về tổng.

## Ý tưởng triển khai
- Lượt 2 phải dùng `max` để không làm hỏng kết quả của lượt 1.
- Điểm **bằng nhau** không tạo ràng buộc: hai đứa kề nhau cùng điểm có thể nhận số kẹo khác nhau (ví dụ 2).
- `(0..<n - 1).reversed()`; với `n = 1` cả hai khoảng đều rỗng và đáp án là `1`.
- Test cục bộ đối chiếu với cách "tăng dần tới khi mọi ràng buộc thỏa" trên 3000 mảng ngẫu nhiên.

## Ví dụ chạy từng bước
**Input:** `ratings = [1, 0, 2]`
**Output:** `5`

```
Khởi tạo:           c = [1, 1, 1]
Lượt trái → phải:
   i=1: 0 > 1 sai
   i=2: 2 > 0 ✓ → c[2] = c[1] + 1 = 2          c = [1, 1, 2]
Lượt phải → trái:
   i=1: 0 > 2 sai
   i=0: 1 > 0 ✓ → c[0] = max(1, c[1] + 1) = 2  c = [2, 1, 2]
Tổng: 2 + 1 + 2 = 5
```

**Input:** `ratings = [1, 2, 2]`
**Output:** `4`

```
Lượt trái → phải: i=1: 2 > 1 ✓ → c[1] = 2 · i=2: 2 > 2 sai   c = [1, 2, 1]
Lượt phải → trái: i=1: 2 > 2 sai · i=0: 1 > 2 sai             c = [1, 2, 1]
Tổng: 4   (đứa thứ ba cùng điểm với đứa thứ hai nhưng chỉ nhận 1 viên)
```

**Input:** `ratings = [1, 3, 4, 5, 2]` → **Output:** `11`

```
Lượt trái → phải: c = [1, 2, 3, 4, 1]
Lượt phải → trái: i=3: 5 > 2 ✓ → c[3] = max(4, 1 + 1) = 4 (giữ nguyên nhờ max)
Tổng: 1 + 2 + 3 + 4 + 1 = 11
```

## Ghi nhớ
Ràng buộc với cả hai hàng xóm → hai lượt quét ngược chiều rồi lấy `max`. Bài "Hard" này chỉ khó ở chỗ nhận ra hai phía tách được độc lập.
