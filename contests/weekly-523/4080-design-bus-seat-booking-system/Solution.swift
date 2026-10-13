class BusBooking {
    var cost = [String: Int]()   // ghế đang đặt -> thời gian đã tốn lúc đặt
    var total = 0

    init(_ n: Int) {
    }

    func toggle(_ seat: String) {
        // đang đặt thì hủy, trả lại đúng chi phí lúc đặt
        if let c = cost[seat] {
            total -= c
            cost[seat] = nil
            return
        }

        let row = seat.dropFirst()
        var c = 1
        if seat.first == "A" && cost["B" + row] != nil { c = 3 }
        if seat.first == "D" && cost["C" + row] != nil { c = 3 }
        cost[seat] = c
        total += c
    }

    func getTotalTime() -> Int {
        return total
    }

    func getMinTime() -> Int {
        // đặt hết ghế cửa sổ trước thì ghế nào cũng chỉ tốn 1 giây
        return cost.count
    }
}
