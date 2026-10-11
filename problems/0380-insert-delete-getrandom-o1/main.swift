let s = RandomizedSet()
precondition(s.insert(1) == true)
precondition(s.remove(2) == false)
precondition(s.insert(2) == true)
precondition([1, 2].contains(s.getRandom()))
precondition(s.remove(1) == true)
precondition(s.insert(2) == false)
precondition(s.getRandom() == 2)

// xóa chính phần tử cuối
let t = RandomizedSet()
_ = t.insert(7)
precondition(t.remove(7) == true)
precondition(t.insert(7) == true)
precondition(t.getRandom() == 7)

// đối chiếu với Set trên thao tác ngẫu nhiên
let r = RandomizedSet()
var ref = Set<Int>()
for _ in 0..<20000 {
    let v = Int.random(in: 0...30)
    switch Int.random(in: 0...2) {
    case 0: precondition(r.insert(v) == ref.insert(v).inserted)
    case 1: precondition(r.remove(v) == (ref.remove(v) != nil))
    default: if !ref.isEmpty { precondition(ref.contains(r.getRandom())) }
    }
    precondition(r.arr.count == ref.count)
}

// getRandom phải ra đủ mọi phần tử
let u = RandomizedSet()
for v in 1...5 { _ = u.insert(v) }
var seen = Set<Int>()
for _ in 0..<2000 { seen.insert(u.getRandom()) }
precondition(seen == [1, 2, 3, 4, 5])
print("OK")
