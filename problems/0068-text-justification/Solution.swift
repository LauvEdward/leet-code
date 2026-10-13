class Solution {
    func fullJustify(_ words: [String], _ maxWidth: Int) -> [String] {
        let n = words.count
        var res = [String]()
        var i = 0

        while i < n {
            // nhét được các từ i..<j vào một dòng (mỗi khe ít nhất 1 dấu cách)
            var j = i, len = 0
            while j < n && len + words[j].count + (j - i) <= maxWidth {
                len += words[j].count
                j += 1
            }

            let gaps = j - i - 1
            var line = ""
            if j == n || gaps == 0 {
                // dòng cuối hoặc dòng 1 từ: dồn trái
                line = words[i..<j].joined(separator: " ")
                line += String(repeating: " ", count: maxWidth - line.count)
            } else {
                let spaces = maxWidth - len
                let each = spaces / gaps, extra = spaces % gaps
                for k in i..<j {
                    line += words[k]
                    if k < j - 1 {
                        // các khe bên trái nhận thêm 1 dấu cách dư
                        line += String(repeating: " ", count: each + (k - i < extra ? 1 : 0))
                    }
                }
            }
            res.append(line)
            i = j
        }
        return res
    }
}
