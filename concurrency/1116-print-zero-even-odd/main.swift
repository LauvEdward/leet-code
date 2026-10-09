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
    let n = Int.random(in: 1...25)
    let zeo = ZeroEvenOdd(n)
    let lock = NSLock()
    var out = [Int]()
    func add(_ x: Int) { lock.lock(); out.append(x); lock.unlock() }

    runAll([
        { zeo.zero(add) },
        { zeo.even(add) },
        { zeo.odd(add) },
    ])
    let want = (1...n).flatMap { [0, $0] }
    precondition(out == want, "n=\(n): got \(out)")
}
print("OK")
