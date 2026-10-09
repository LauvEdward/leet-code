---
id: 3
title: Longest Substring Without Repeating Characters
slug: longest-substring-without-repeating-characters
difficulty: Medium
topics: Hash Table, String, Sliding Window
date: 2026-10-09
time: O(n)
space: O(n) (mảng ký tự; bảng băm tối đa bằng kích thước bảng chữ cái)
status: Accepted
---
## Đề bài
Cho chuỗi `s`, tìm độ dài của chuỗi con (liên tiếp) dài nhất không chứa ký tự lặp lại.

## Cơ sở lý thuyết
- **Cửa sổ trượt (Sliding Window)**: duy trì một đoạn liên tiếp `[start, i]` luôn thỏa một bất biến (ở đây: không có ký tự trùng). Biên phải chỉ tiến, biên trái cũng chỉ tiến → mỗi phần tử được xét `O(1)` lần, tổng `O(n)`.
- **Tính đơn điệu**: nếu `[start, i]` có ký tự trùng thì mọi cửa sổ rộng hơn chứa nó cũng trùng. Vì thế không bao giờ cần lùi `start`.
- **Bảng băm ký tự → vị trí**: cho phép biết ngay ký tự vừa gặp đã xuất hiện ở đâu, không phải dò lại cửa sổ.

## Hướng xử lý
1. Vét cạn mọi chuỗi con là `O(n²)` đến `O(n³)`.
2. Mở rộng cửa sổ sang phải từng ký tự. Khi ký tự mới `c` đã có trong cửa sổ, phải thu biên trái vượt qua lần xuất hiện trước đó của `c`.
3. Thay vì thu từng bước (dùng `Set`), ta nhớ **vị trí gần nhất** của mỗi ký tự và nhảy `start` thẳng tới `last[c] + 1`.

## Ý tưởng triển khai
- `Array(s)` để có chỉ số nguyên; `last: [Character: Int]` lưu chỉ số gần nhất của mỗi ký tự.
- Điều kiện `j >= start` là mấu chốt: lần xuất hiện cũ chỉ gây xung đột khi nó còn **nằm trong cửa sổ**. Thiếu điều kiện này sẽ sai với `"abba"` (`start` bị kéo lùi về sau khi gặp `a` thứ hai).
- Cập nhật `best = max(best, i - start + 1)` sau mỗi bước.
- Muốn nhanh hơn thì đổi `Dictionary` thành mảng 128 ô duyệt trên `s.utf8`, nhưng bản này đã đủ qua và dễ đọc hơn.

## Ghi nhớ
Cụm "chuỗi con / mảng con **liên tiếp** dài nhất (ngắn nhất) thỏa điều kiện" gần như luôn là cửa sổ trượt. Trong Swift, hãy chuyển sang `utf8` hoặc `Array(s)` trước khi cần chỉ số — `String.Index` không phải số nguyên.
