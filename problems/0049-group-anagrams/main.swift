func norm(_ g: [[String]]) -> [[String]] {
    return g.map { $0.sorted() }.sorted { $0.joined(separator: ",") < $1.joined(separator: ",") }
}

precondition(norm(Solution().groupAnagrams(["eat", "tea", "tan", "ate", "nat", "bat"])) == norm([["bat"], ["nat", "tan"], ["ate", "eat", "tea"]]))
precondition(Solution().groupAnagrams([""]) == [[""]])
precondition(Solution().groupAnagrams(["a"]) == [["a"]])
precondition(norm(Solution().groupAnagrams(["", "", "b"])) == norm([["", ""], ["b"]]))
precondition(norm(Solution().groupAnagrams(["abc", "bca", "cab", "abd"])) == norm([["abc", "bca", "cab"], ["abd"]]))
print("OK")
