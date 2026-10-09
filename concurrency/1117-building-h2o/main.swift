import Foundation

func runAll(_ jobs: [() -> Void]) {
    let g = DispatchGroup()
    for j in jobs.shuffled() {
        g.enter()
        Thread.detachNewThread { j(); g.leave() }
    }
    precondition(g.wait(timeout: .now() + 5) == .success, "deadlock?")
}

for _ in 0..<200 {
    let k = Int.random(in: 1...12)   // số phân tử nước
    let w = H2O()
    let lock = NSLock()
    var out = [Character]()
    func add(_ c: Character) { lock.lock(); out.append(c); lock.unlock() }

    var jobs = [() -> Void]()
    for _ in 0..<2 * k { jobs.append { w.hydrogen { add("H") } } }
    for _ in 0..<k { jobs.append { w.oxygen { add("O") } } }
    runAll(jobs)

    precondition(out.count == 3 * k)
    // cứ mỗi 3 ký tự liên tiếp phải là 2 H + 1 O
    for i in stride(from: 0, to: out.count, by: 3) {
        precondition(String(out[i..<i + 3].sorted()) == "HHO", "k=\(k): got \(String(out))")
    }
}
print("OK")
