---
id: 71
title: Simplify Path
slug: simplify-path
difficulty: Medium
topics: Stack, String
date: 2026-10-19
time: O(n)
space: O(n)
status: Chưa nộp (LeetCode trong Chrome chưa đăng nhập)
---
## Đề bài
Rút gọn một đường dẫn tuyệt đối kiểu Unix: `.` là thư mục hiện tại, `..` là thư mục cha, nhiều dấu `/` liên tiếp coi như một. Mọi tên khác (kể cả `...`) là tên thư mục bình thường. Kết quả bắt đầu bằng `/`, không có `/` ở cuối.

## Cơ sở lý thuyết
- **Ngăn xếp thư mục**: đi vào thư mục con là đẩy vào, `..` là bỏ phần tử trên đỉnh. Đường dẫn chuẩn là nội dung ngăn xếp nối bằng `/`.
- Ở thư mục gốc, `..` không làm gì (cha của gốc là chính nó).
- `split` bỏ đoạn rỗng nên xử lý luôn chuyện nhiều dấu `/` liên tiếp và dấu `/` ở đầu/cuối.

## Hướng xử lý
1. Tách đường dẫn theo `/`.
2. Với mỗi phần: `.` → bỏ qua; `..` → bỏ đỉnh ngăn xếp nếu có; còn lại → đẩy vào.
3. Kết quả là `"/"` nối với các phần trong ngăn xếp.

## Ý tưởng triển khai
- `_ = st.popLast()` — trên ngăn xếp rỗng trả `nil`, không crash, đúng hành vi "`..` ở gốc không làm gì".
- So sánh `Substring` với chuỗi hằng `"."` và `".."` trực tiếp được.
- Ngăn xếp rỗng → `"/" + ""` = `"/"`.

## Ví dụ chạy từng bước
**Input:** `path = "/.../a/../b/c/../d/./"`
**Output:** `"/.../b/d"`

```
Tách: ["...", "a", "..", "b", "c", "..", "d", "."]
"..." → tên thư mục bình thường → st = [...]
"a"   → st = [..., a]
".."  → bỏ a → st = [...]
"b"   → st = [..., b]
"c"   → st = [..., b, c]
".."  → bỏ c → st = [..., b]
"d"   → st = [..., b, d]
"."   → bỏ qua
Kết quả: "/" + ".../b/d"
```

**Input:** `path = "/../"` → **Output:** `"/"`

```
Tách: [".."] → popLast trên ngăn xếp rỗng → không làm gì → "/"
```

**Input:** `path = "/home//foo/"` → **Output:** `"/home/foo"` (đoạn rỗng giữa `//` bị `split` bỏ).

## Ghi nhớ
Xử lý đường dẫn, lịch sử điều hướng, hoàn tác → ngăn xếp. Đọc kỹ đề: chỉ đúng `.` và `..` là đặc biệt, `...` là tên thường.
