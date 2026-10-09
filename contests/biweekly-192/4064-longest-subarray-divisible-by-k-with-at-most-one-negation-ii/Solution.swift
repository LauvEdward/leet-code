class Solution {
    func longestSubarray(_ nums: [Int], _ k: Int) -> Int {
        let INF = Int.max

        // first[u]: l nhỏ nhất có tổng tiền tố P[l] % k == u
        var first = [Int](repeating: INF, count: k)
        first[0] = 0
        var order = [0]   // các số dư theo thứ tự xuất hiện lần đầu

        // e[v]: l nhỏ nhất sao cho có i >= l (đã duyệt) với (P[l] + 2*nums[i]) % k == v
        var e = [Int](repeating: INF, count: k)
        // done[s]: với độ dịch s, đã ghép xong bao nhiêu phần tử đầu của order
        var done = [Int](repeating: 0, count: k)

        var p = 0, best = 0
        for r in 0..<nums.count {
            let s = ((2 * nums[r]) % k + k) % k

            // ghép nums[r] với các số dư mới xuất hiện kể từ lần cuối gặp độ dịch s
            for t in done[s]..<order.count {
                let u = order[t]
                let v = (u + s) % k
                e[v] = min(e[v], first[u])
            }
            done[s] = order.count

            p = ((p + nums[r]) % k + k) % k
            let l = min(first[p], e[p])
            if l != INF { best = max(best, r + 1 - l) }

            if first[p] == INF {
                first[p] = r + 1
                order.append(p)
            }
        }
        return best
    }
}
