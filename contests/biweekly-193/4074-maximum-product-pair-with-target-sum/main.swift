// đáp án có thể không duy nhất nên kiểm tra tính hợp lệ + tích lớn nhất
func check(_ a: [Int], _ t: Int, _ wantProduct: Int?, line: UInt = #line) {
    let r = Solution().maxProductPair(a, t)
    if let w = wantProduct {
        precondition(r[0] != r[1] && a[r[0]] + a[r[1]] == t && a[r[0]] > a[r[1]], "line \(line): cặp không hợp lệ \(r)")
        precondition(a[r[0]] * a[r[1]] == w, "line \(line): got \(r), want product \(w)")
    } else {
        precondition(r == [-1, -1], "line \(line): got \(r)")
    }
}

check([1, 2, 3, 4], 5, 6)
check([-3, -1, 4, 2], 1, -2)
check([3, 3, 5], 6, nil)
check([0, 0], 0, nil)
check([5, -5], 0, -25)
check([100, -100, 50, -50], 0, -2500)
precondition(Solution().maxProductPair([1, 2, 3, 4], 5) == [2, 1])
precondition(Solution().maxProductPair([-3, -1, 4, 2], 1) == [3, 1])
print("OK")
