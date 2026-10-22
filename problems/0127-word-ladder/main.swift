import Foundation

precondition(Solution().ladderLength("hit", "cog", ["hot", "dot", "dog", "lot", "log", "cog"]) == 5)
precondition(Solution().ladderLength("hit", "cog", ["hot", "dot", "dog", "lot", "log"]) == 0)
precondition(Solution().ladderLength("a", "c", ["a", "b", "c"]) == 2)
precondition(Solution().ladderLength("hot", "dog", ["hot", "dog"]) == 0)
// danh sách lớn: 5000 từ dài 5, phải chạy nhanh
var words = Set<String>()
while words.count < 5000 { words.insert(String((0..<5).map { _ in "abcdef".randomElement()! })) }
let list = Array(words)
let t0 = Date()
_ = Solution().ladderLength("aaaaa", list[0], list)
precondition(Date().timeIntervalSince(t0) < 20)
print("OK")
