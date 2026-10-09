import Foundation

// Chạy mỗi job trên một luồng riêng, thứ tự khởi động ngẫu nhiên
func runAll(_ jobs: [() -> Void]) {
    let g = DispatchGroup()
    for j in jobs.shuffled() {
        g.enter()
        Thread.detachNewThread { j(); g.leave() }
    }
    precondition(g.wait(timeout: .now() + 5) == .success, "deadlock?")
}

for _ in 0..<300 {
    let foo = Foo()
    let lock = NSLock()
    var out = [String]()
    func add(_ s: String) { lock.lock(); out.append(s); lock.unlock() }

    runAll([
        { foo.first { add("first") } },
        { foo.second { add("second") } },
        { foo.third { add("third") } },
    ])
    precondition(out == ["first", "second", "third"], "got \(out)")
}
print("OK")
