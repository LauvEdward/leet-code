let c = LRUCache(2)
c.put(1, 1); c.put(2, 2)
precondition(c.get(1) == 1)
c.put(3, 3)                       // đẩy 2 ra
precondition(c.get(2) == -1)
c.put(4, 4)                       // đẩy 1 ra
precondition(c.get(1) == -1 && c.get(3) == 3 && c.get(4) == 4)

let d = LRUCache(1)
d.put(2, 1)
precondition(d.get(2) == 1)
d.put(3, 2)
precondition(d.get(2) == -1 && d.get(3) == 2)

// đối chiếu với mô hình mảng đơn giản
for cap in 1...4 {
    let x = LRUCache(cap)
    var ref = [(Int, Int)]()      // phần tử cuối = mới dùng nhất
    for _ in 0..<5000 {
        let k = Int.random(in: 0...6)
        if Bool.random() {
            let got = x.get(k)
            if let i = ref.firstIndex(where: { $0.0 == k }) {
                precondition(got == ref[i].1)
                ref.append(ref.remove(at: i))
            } else { precondition(got == -1) }
        } else {
            let v = Int.random(in: 0...99)
            x.put(k, v)
            if let i = ref.firstIndex(where: { $0.0 == k }) { ref.remove(at: i) }
            else if ref.count == cap { ref.removeFirst() }
            ref.append((k, v))
        }
    }
}
print("OK")
