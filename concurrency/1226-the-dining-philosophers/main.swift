import Foundation

func runAll(_ jobs: [() -> Void]) {
    let g = DispatchGroup()
    for j in jobs.shuffled() {
        g.enter()
        Thread.detachNewThread { j(); g.leave() }
    }
    precondition(g.wait(timeout: .now() + 10) == .success, "deadlock?")
}

for _ in 0..<50 {
    let dp = DiningPhilosophers()
    let lock = NSLock()
    var holder = [Int?](repeating: nil, count: 5)   // nĩa nào đang do ai cầm
    var eats = 0
    let times = 20

    func pick(_ p: Int, _ fork: Int) {
        lock.lock()
        precondition(holder[fork] == nil, "nĩa \(fork) đang bị cầm bởi \(holder[fork]!)")
        holder[fork] = p
        lock.unlock()
    }
    func put(_ p: Int, _ fork: Int) {
        lock.lock()
        precondition(holder[fork] == p)
        holder[fork] = nil
        lock.unlock()
    }

    var jobs = [() -> Void]()
    for p in 0..<5 {
        jobs.append {
            let l = p, r = (p + 1) % 5
            for _ in 0..<times {
                dp.wantsToEat(p,
                              { pick(p, l) },
                              { pick(p, r) },
                              {
                                  lock.lock()
                                  precondition(holder[l] == p && holder[r] == p, "ăn khi chưa đủ 2 nĩa")
                                  eats += 1
                                  lock.unlock()
                              },
                              { put(p, l) },
                              { put(p, r) })
            }
        }
    }
    runAll(jobs)
    precondition(eats == 5 * times)
}
print("OK")
