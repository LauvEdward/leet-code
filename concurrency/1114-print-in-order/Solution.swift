import Foundation

class Foo {
    let s1 = DispatchSemaphore(value: 0)
    let s2 = DispatchSemaphore(value: 0)

    func first(_ printFirst: () -> Void) {
        printFirst()
        s1.signal()
    }

    func second(_ printSecond: () -> Void) {
        s1.wait()
        printSecond()
        s2.signal()
    }

    func third(_ printThird: () -> Void) {
        s2.wait()
        printThird()
    }
}
