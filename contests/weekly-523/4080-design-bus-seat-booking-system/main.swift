let b = BusBooking(20)
b.toggle("B3"); b.toggle("A3")
precondition(b.getTotalTime() == 4 && b.getMinTime() == 2)
b.toggle("C3"); b.toggle("D3")
precondition(b.getTotalTime() == 8 && b.getMinTime() == 4)

let c = BusBooking(10)
c.toggle("C7"); c.toggle("D7")
precondition(c.getTotalTime() == 4)
c.toggle("D7"); c.toggle("C7"); c.toggle("D7")
precondition(c.getTotalTime() == 1 && c.getMinTime() == 1)

let e = BusBooking(100000)
precondition(e.getTotalTime() == 0 && e.getMinTime() == 0)
e.toggle("A100000"); e.toggle("B100000")
precondition(e.getTotalTime() == 2)   // cửa sổ trước, giữa sau: không bị chậm
e.toggle("D12"); e.toggle("C1")       // khác hàng: không ảnh hưởng nhau
precondition(e.getTotalTime() == 4 && e.getMinTime() == 4)

// mô phỏng độc lập + vét cạn thứ tự đặt cho getMinTime
func bookCost(_ seat: String, _ booked: Set<String>) -> Int {
    let row = seat.dropFirst()
    if seat.first == "A" && booked.contains("B\(row)") { return 3 }
    if seat.first == "D" && booked.contains("C\(row)") { return 3 }
    return 1
}
func perms(_ a: [String]) -> [[String]] {
    if a.count <= 1 { return [a] }
    var out = [[String]]()
    for i in 0..<a.count {
        var rest = a
        let x = rest.remove(at: i)
        for p in perms(rest) { out.append([x] + p) }
    }
    return out
}
for _ in 0..<300 {
    let sys = BusBooking(2)
    var refCost = [String: Int]()
    for _ in 0..<12 {
        let seat = "\("ABCD".randomElement()!)\(Int.random(in: 1...2))"
        sys.toggle(seat)
        if refCost[seat] != nil { refCost[seat] = nil } else { refCost[seat] = bookCost(seat, Set(refCost.keys)) }
        precondition(sys.getTotalTime() == refCost.values.reduce(0, +))
        let seats = Array(refCost.keys)
        if seats.count <= 6 {
            var best = seats.isEmpty ? 0 : Int.max
            for order in perms(seats) {
                var done = Set<String>(), t = 0
                for s in order { t += bookCost(s, done); done.insert(s) }
                best = min(best, t)
            }
            precondition(sys.getMinTime() == best)
        }
    }
}
print("OK")
