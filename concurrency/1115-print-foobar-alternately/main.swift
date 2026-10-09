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
    let n = Int.random(in: 1...30)
    let fb = FooBar(n)
    let lock = NSLock()
    var out = ""
    func add(_ s: String) { lock.lock(); out += s; lock.unlock() }

    runAll([
        { fb.foo { add("foo") } },
        { fb.bar { add("bar") } },
    ])
    let want = String(repeating: "foobar", count: n)
    precondition(out == want, "n=\(n): got \(out)")
}
print("OK")
