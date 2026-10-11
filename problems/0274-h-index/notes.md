---
id: 274
title: H-Index
slug: h-index
difficulty: Medium
topics: Array / String, Sorting, Counting Sort
date: 2026-10-11
time: O(n log n)
space: O(n)
status: Accepted
---
## Đề bài
`citations[i]` là số trích dẫn của bài báo thứ `i`. Chỉ số h là số `h` lớn nhất sao cho có ít nhất `h` bài báo, mỗi bài có ít nhất `h` trích dẫn.

## Cơ sở lý thuyết
- **Sắp xếp để biến điều kiện đếm thành điều kiện vị trí**: sắp giảm dần thì "có ít nhất `h` bài với `≥ h` trích dẫn" tương đương "bài đứng thứ `h` (đánh số từ 1) có `≥ h` trích dẫn".
- **Tính đơn điệu**: sau khi sắp giảm, `a[i]` giảm còn `i + 1` tăng → điều kiện `a[i] ≥ i + 1` đúng trên một đoạn đầu rồi sai mãi. `h` là độ dài đoạn đầu đó.
- Có thể làm `O(n)` bằng đếm (counting sort) vì `h ≤ n`, nhưng sắp xếp dễ viết và đủ nhanh.

## Hướng xử lý
1. Sắp `citations` giảm dần.
2. Duyệt `i`: nếu `a[i] >= i + 1` thì `i + 1` bài đầu đều có ít nhất `i + 1` trích dẫn → `h = i + 1`.
3. Trả về `h` lớn nhất tìm được.

## Ý tưởng triển khai
- `citations.sorted(by: >)`.
- `for i in 0..<a.count where a[i] >= i + 1 { h = i + 1 }` — không cần `break` vì điều kiện đơn điệu; duyệt hết cho gọn.

## Ví dụ chạy từng bước
**Input:** `citations = [3, 0, 6, 1, 5]`
**Output:** `3`

```
Sắp giảm dần: [6, 5, 3, 1, 0]
i=0: 6 >= 1 ✓ → h=1
i=1: 5 >= 2 ✓ → h=2
i=2: 3 >= 3 ✓ → h=3
i=3: 1 >= 4 ✗
i=4: 0 >= 5 ✗
Trả về 3   (ba bài có 6, 5, 3 trích dẫn — mỗi bài ít nhất 3)
```

**Input:** `citations = [1, 3, 1]` → **Output:** `1`

```
Sắp giảm dần: [3, 1, 1]
i=0: 3 >= 1 ✓ → h=1 · i=1: 1 >= 2 ✗ · i=2: 1 >= 3 ✗
```

## Ghi nhớ
Định nghĩa kiểu "ít nhất `h` phần tử có giá trị ít nhất `h`" → sắp giảm rồi so giá trị với thứ hạng. Nếu mảng đã sắp sẵn (bài 275) thì tìm nhị phân trên điểm gãy của điều kiện đơn điệu.
