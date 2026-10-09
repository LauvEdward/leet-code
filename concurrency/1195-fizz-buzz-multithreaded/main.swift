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
    let n = Int.random(in: 1...50)
    let fb = FizzBuzz(n)
    let lock = NSLock()
    var out = [String]()
    func add(_ s: String) { lock.lock(); out.append(s); lock.unlock() }

    runAll([
        { fb.fizz { add("fizz") } },
        { fb.buzz { add("buzz") } },
        { fb.fizzbuzz { add("fizzbuzz") } },
        { fb.number { add(String($0)) } },
    ])
    let want = (1...n).map { $0 % 15 == 0 ? "fizzbuzz" : $0 % 3 == 0 ? "fizz" : $0 % 5 == 0 ? "buzz" : String($0) }
    precondition(out == want, "n=\(n): got \(out)")
}
print("OK")
