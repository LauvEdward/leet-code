---
id: 30
title: Substring with Concatenation of All Words
slug: substring-with-concatenation-of-all-words
difficulty: Hard
topics: Sliding Window, Hash Table, String
date: 2026-10-13
time: O(n · L) (n = độ dài s, L = độ dài một từ)
space: O(số từ · L)
status: Accepted
---
## Đề bài
Cho chuỗi `s` và mảng `words` gồm các từ **cùng độ dài** `L`. Tìm mọi vị trí bắt đầu trong `s` của một chuỗi con là phép ghép của **tất cả** các từ trong `words`, mỗi từ đúng một lần, theo thứ tự bất kỳ.

## Cơ sở lý thuyết
- Vì mọi từ dài bằng nhau, một chuỗi con hợp lệ bắt đầu tại `i` được cắt thành các **ô** dài `L` ở các vị trí `i, i + L, i + 2L, …`. Mọi vị trí bắt đầu có cùng số dư `i mod L` dùng chung một lưới ô.
- **Chia theo độ lệch (offset)**: với mỗi `off` trong `0 ..< L`, coi `s` là một dãy các ô. Bài toán thành: tìm mọi cửa sổ gồm `k` ô liên tiếp có **đa tập** từ trùng với `words` — đây là bài cửa sổ trượt với bảng đếm (giống tìm anagram, bài 438), chỉ khác đơn vị là từ thay cho ký tự.
- Nhờ vậy tổng số ô được xét trên mọi độ lệch là `≈ n`, thay vì kiểm tra lại từ đầu cho từng vị trí bắt đầu (`O(n · k)` ô).

## Hướng xử lý
1. Đếm số lần xuất hiện cần có của mỗi từ: `need`.
2. Với mỗi `off`: cửa sổ `[l, r)` trên lưới ô, bảng đếm `have`, và `cnt` = số ô trong cửa sổ.
3. Đọc ô kế tiếp `w`:
   - `w` không có trong `need` → không cửa sổ nào chứa được ô này: xóa sạch, đặt `l` ngay sau nó.
   - Ngược lại thêm `w` vào cửa sổ. Nếu `w` bị **thừa**, co biên trái từng ô cho tới khi hết thừa.
   - Nếu `cnt == k` → cửa sổ gồm đúng `k` ô hợp lệ, không ô nào thừa → ghi `l`.

## Ý tưởng triển khai
- `need[w] == nil` để nhận biết từ lạ; `have[w, default: 0] += 1` để đếm.
- Không cần co cửa sổ riêng sau khi ghi kết quả: ở vòng sau, ô mới vào sẽ làm một từ bị thừa (hoặc là từ lạ), và vòng `while` tự đẩy `l` lên.
- Bất biến: mọi từ trong cửa sổ đều có `have ≤ need`, nên `cnt == k` tương đương `have == need`.
- `String(a[r..<r + L])` tạo khóa cho bảng băm.
- Test cục bộ đối chiếu với vét cạn (cắt, sắp xếp các ô rồi so với `words` đã sắp) trên 4000 bộ ngẫu nhiên.

## Ví dụ chạy từng bước
**Input:** `s = "barfoothefoobarman"`, `words = ["foo", "bar"]`
**Output:** `[0, 9]`

`L = 3`, `k = 2`, `need = {foo: 1, bar: 1}`.

```
off = 0 → các ô: bar | foo | the | foo | bar | man
   ô "bar" (r=0→3):   have = {bar: 1}, cnt=1
   ô "foo" (r=3→6):   have = {bar: 1, foo: 1}, cnt=2 == k → ghi l = 0
   ô "the" (r=6→9):   từ lạ → xóa sạch, l = 9
   ô "foo" (r=9→12):  have = {foo: 1}, cnt=1
   ô "bar" (r=12→15): have = {foo: 1, bar: 1}, cnt=2 == k → ghi l = 9
   ô "man" (r=15→18): từ lạ → xóa sạch, l = 18

off = 1 → các ô: arf | oot | hef | oob | arm → toàn từ lạ
off = 2 → các ô: rfo | oth | efo | oba | rma → toàn từ lạ

Kết quả: [0, 9]
```

**Input:** `s = "barfoofoobarthefoobarman"`, `words = ["bar", "foo", "the"]`
**Output:** `[6, 9, 12]`

```
off = 0 → các ô: bar | foo | foo | bar | the | foo | bar | man   (k = 3)
   bar, foo:   cnt=2
   foo:        thừa foo → bỏ "bar" (l=3), bỏ "foo" (l=6) → have = {foo: 1}, cnt=1
   bar:        cnt=2
   the:        cnt=3 → ghi l = 6
   foo:        thừa foo → bỏ "foo" (l=9) → cnt=3 → ghi l = 9
   bar:        thừa bar → bỏ "bar" (l=12) → cnt=3 → ghi l = 12
   man:        từ lạ → xóa sạch
```

## Ghi nhớ
Khi các "đơn vị" có độ dài cố định `L`, chia bài toán theo `L` độ lệch rồi trượt cửa sổ theo từng đơn vị. Cửa sổ có bảng đếm: thêm bên phải, co bên trái khi thừa, kiểm tra kích thước — cùng một khuôn với bài 76 và 438.
