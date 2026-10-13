func check(_ words: [String], _ w: Int, _ want: [String], line: UInt = #line) {
    let got = Solution().fullJustify(words, w)
    precondition(got == want, "line \(line): got \(got), want \(want)")
}

check(["This", "is", "an", "example", "of", "text", "justification."], 16,
      ["This    is    an", "example  of text", "justification.  "])
check(["What", "must", "be", "acknowledgment", "shall", "be"], 16,
      ["What   must   be", "acknowledgment  ", "shall be        "])
check(["Science", "is", "what", "we", "understand", "well", "enough", "to", "explain", "to", "a", "computer.", "Art", "is", "everything", "else", "we", "do"], 20,
      ["Science  is  what we", "understand      well", "enough to explain to", "a  computer.  Art is", "everything  else  we", "do                  "])
check(["a"], 1, ["a"])
check(["a", "b", "c"], 1, ["a", "b", "c"])
check(["ab"], 5, ["ab   "])

// tính chất chung trên dữ liệu ngẫu nhiên
for _ in 0..<2000 {
    let w = Int.random(in: 3...12)
    let words = (0..<Int.random(in: 1...8)).map { _ in String(repeating: "x", count: Int.random(in: 1...w)) }
    let out = Solution().fullJustify(words, w)
    precondition(out.allSatisfy { $0.count == w })
    precondition(out.flatMap { $0.split(separator: " ").map(String.init) } == words)
    for l in out.dropLast() where l.contains(" ") && l.split(separator: " ").count > 1 {
        precondition(l.last != " ", "dòng giữa nhiều từ không được thừa cách ở cuối: '\(l)'")
    }
}
print("OK")
