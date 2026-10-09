class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        // a là mảng ngắn hơn
        var a = nums1, b = nums2
        if a.count > b.count { swap(&a, &b) }
        let m = a.count, n = b.count
        let half = (m + n + 1) / 2

        var lo = 0, hi = m
        while lo <= hi {
            let i = (lo + hi) / 2
            let j = half - i

            let aL = i > 0 ? a[i - 1] : Int.min
            let aR = i < m ? a[i] : Int.max
            let bL = j > 0 ? b[j - 1] : Int.min
            let bR = j < n ? b[j] : Int.max

            if aL > bR {
                hi = i - 1
            } else if bL > aR {
                lo = i + 1
            } else {
                if (m + n) % 2 == 1 { return Double(max(aL, bL)) }
                return Double(max(aL, bL) + min(aR, bR)) / 2
            }
        }
        return 0
    }
}
