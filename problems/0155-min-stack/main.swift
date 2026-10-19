let s = MinStack()
s.push(-2); s.push(0); s.push(-3)
precondition(s.getMin() == -3)
s.pop()
precondition(s.top() == 0 && s.getMin() == -2)

// đối chiếu với mảng thường
let m = MinStack()
var ref = [Int]()
for _ in 0..<20000 {
    if ref.isEmpty || Bool.random() {
        let v = Int.random(in: -50...50)
        m.push(v); ref.append(v)
    } else {
        m.pop(); ref.removeLast()
    }
    if !ref.isEmpty { precondition(m.top() == ref.last! && m.getMin() == ref.min()!) }
}
print("OK")
