---
id: 6
title: Zigzag Conversion
slug: zigzag-conversion
difficulty: Medium
topics: String, Simulation
date: 2026-10-09
time: O(n)
space: O(n)
status: Accepted
---
## Đề bài
Viết chuỗi `s` theo hình zigzag trên `numRows` dòng (đi xuống rồi chéo lên, lặp lại), sau đó đọc từng dòng từ trái sang phải và nối lại.

## Cơ sở lý thuyết
- **Mô phỏng (Simulation)**: làm đúng theo quy trình đề mô tả, không cần công thức thông minh.
- Điều duy nhất quan trọng là **mỗi ký tự rơi vào dòng nào**; vị trí cột không ảnh hưởng vì ta chỉ đọc theo dòng, và trong cùng một dòng các ký tự xuất hiện đúng theo thứ tự gốc.
- Chỉ số dòng dao động kiểu "quả bóng nảy": `0, 1, …, numRows-1, numRows-2, …, 1, 0, 1, …` với chu kỳ `2 * (numRows - 1)`.

## Hướng xử lý
1. Không cần dựng ma trận 2 chiều — chỉ cần `numRows` chuỗi, mỗi chuỗi gom các ký tự của một dòng.
2. Duyệt `s`, giữ dòng hiện tại `r` và hướng đi `step` (`+1` xuống, `-1` lên). Chạm dòng đầu hoặc dòng cuối thì đổi hướng.
3. Nối các dòng lại là xong.

Cách khác: tính trực tiếp chỉ số bằng chu kỳ `2 * (numRows - 1)` để không cần bộ nhớ theo dòng, nhưng khó đọc hơn mà độ phức tạp không đổi.

## Ý tưởng triển khai
- `rows = [String](repeating: "", count: numRows)`.
- Đặt hướng **trước** khi bước: ở dòng `0` thì `step = 1`, ở dòng cuối thì `step = -1`, rồi `r += step`.
- **Trường hợp biên `numRows == 1`**: dòng đầu cũng là dòng cuối, `step` sẽ thành `-1` và `r` chạy ra `-1` → crash. Phải trả về `s` ngay từ đầu.
- Khi `numRows >= s.count` không cần xử lý riêng: mỗi ký tự một dòng, nối lại vẫn ra `s`.

## Ghi nhớ
Gặp bài "sắp xếp theo hình dạng rồi đọc lại", hãy hỏi: thông tin nào thật sự cần giữ? Ở đây chỉ là chỉ số dòng. Luôn thử trường hợp suy biến (`numRows = 1`) trước khi nộp.
