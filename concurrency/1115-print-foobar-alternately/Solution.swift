import Foundation

class FooBar {
    let n: Int
    let fooSem = DispatchSemaphore(value: 1)
    let barSem = DispatchSemaphore(value: 0)

    init(_ n: Int) {
        self.n = n
    }

    func foo(_ printFoo: () -> Void) {
        for _ in 0..<n {
            fooSem.wait()
            printFoo()
            barSem.signal()
        }
    }

    func bar(_ printBar: () -> Void) {
        for _ in 0..<n {
            barSem.wait()
            printBar()
            fooSem.signal()
        }
    }
}
