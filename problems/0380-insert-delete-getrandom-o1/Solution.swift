class RandomizedSet {
    var arr = [Int]()
    var idx = [Int: Int]()   // giá trị -> vị trí trong arr

    init() {
    }

    func insert(_ val: Int) -> Bool {
        if idx[val] != nil { return false }
        idx[val] = arr.count
        arr.append(val)
        return true
    }

    func remove(_ val: Int) -> Bool {
        guard let i = idx[val] else { return false }
        // đưa phần tử cuối vào chỗ trống rồi cắt đuôi
        let last = arr[arr.count - 1]
        arr[i] = last
        idx[last] = i
        arr.removeLast()
        idx[val] = nil
        return true
    }

    func getRandom() -> Int {
        return arr.randomElement()!
    }
}
