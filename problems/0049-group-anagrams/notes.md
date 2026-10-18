---
id: 49
title: Group Anagrams
slug: group-anagrams
difficulty: Medium
topics: Hashmap, String, Sorting
date: 2026-10-18
time: O(n · k log k) (k = độ dài chuỗi dài nhất)
space: O(n · k)
status: Chưa nộp (LeetCode trong Chrome chưa đăng nhập)
---
## Đề bài
Gom các chuỗi trong mảng thành từng nhóm, mỗi nhóm gồm các chuỗi là anagram của nhau. Thứ tự nhóm và thứ tự trong nhóm tùy ý.

## Cơ sở lý thuyết
- **Dạng chuẩn (canonical form)**: biến mỗi phần tử thành một đại diện sao cho hai phần tử "tương đương" luôn có cùng đại diện. Với anagram, dạng chuẩn là chuỗi các ký tự **đã sắp xếp**.
- **Gom nhóm bằng bảng băm**: khóa là dạng chuẩn, giá trị là danh sách phần tử. Đây là phép chia tập hợp thành các **lớp tương đương**.
- Dạng chuẩn khác: vector đếm 26 chữ cái (`O(k)` thay vì `O(k log k)` cho mỗi chuỗi).

## Hướng xử lý
1. Với mỗi chuỗi, tính khóa `String(s.sorted())`.
2. Thêm chuỗi vào danh sách ứng với khóa đó.
3. Trả về mọi danh sách.

## Ý tưởng triển khai
- `groups[key, default: []].append(s)` — thêm vào danh sách, tự tạo nếu chưa có.
- `Array(groups.values)` — thứ tự nhóm không xác định nhưng đề chấp nhận mọi thứ tự; test cục bộ chuẩn hóa thứ tự trước khi so.
- Chuỗi rỗng có khóa là chuỗi rỗng, vẫn được gom đúng.

## Ví dụ chạy từng bước
**Input:** `strs = ["eat", "tea", "tan", "ate", "nat", "bat"]`
**Output:** `[["bat"], ["nat", "tan"], ["ate", "eat", "tea"]]` (thứ tự tùy ý)

```
"eat" → khóa "aet" → {aet: [eat]}
"tea" → khóa "aet" → {aet: [eat, tea]}
"tan" → khóa "ant" → {aet: [eat, tea], ant: [tan]}
"ate" → khóa "aet" → {aet: [eat, tea, ate], ant: [tan]}
"nat" → khóa "ant" → {…, ant: [tan, nat]}
"bat" → khóa "abt" → {…, abt: [bat]}
Ba nhóm: [eat, tea, ate], [tan, nat], [bat]
```

**Input:** `strs = [""]` → **Output:** `[[""]]`

## Ghi nhớ
"Gom các phần tử tương đương" → tìm dạng chuẩn, dùng làm khóa bảng băm. Mẫu này áp dụng cho nhiều bài khác: chuỗi dịch vòng (249), tọa độ hình dạng đảo (694)…
