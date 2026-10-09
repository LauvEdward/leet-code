import Foundation

class ZeroEvenOdd {
    let n: Int
    let z = DispatchSemaphore(value: 1)
    let e = DispatchSemaphore(value: 0)
    let o = DispatchSemaphore(value: 0)

    init(_ n: Int) {
        self.n = n
    }

    func zero(_ printNumber: (Int) -> Void) {
        for i in 1...n {
            z.wait()
            printNumber(0)
            // số sắp in là i: lẻ thì gọi odd, chẵn thì gọi even
            if i % 2 == 1 { o.signal() } else { e.signal() }
        }
    }

    func even(_ printNumber: (Int) -> Void) {
        for i in stride(from: 2, through: n, by: 2) {
            e.wait()
            printNumber(i)
            z.signal()
        }
    }

    func odd(_ printNumber: (Int) -> Void) {
        for i in stride(from: 1, through: n, by: 2) {
            o.wait()
            printNumber(i)
            z.signal()
        }
    }
}
