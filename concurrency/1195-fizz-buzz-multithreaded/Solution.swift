import Foundation

class FizzBuzz {
    let n: Int
    var i = 1
    let cond = NSCondition()

    init(_ n: Int) {
        self.n = n
    }

    // chờ tới lượt số i thuộc về mình thì xử lý, hết số thì thoát
    func run(_ mine: (Int) -> Bool, _ act: (Int) -> Void) {
        while true {
            cond.lock()
            while i <= n && !mine(i) {
                cond.wait()
            }
            if i > n {
                cond.unlock()
                return
            }
            act(i)
            i += 1
            cond.broadcast()
            cond.unlock()
        }
    }

    func fizz(_ printFizz: () -> Void) {
        run({ $0 % 3 == 0 && $0 % 5 != 0 }, { _ in printFizz() })
    }

    func buzz(_ printBuzz: () -> Void) {
        run({ $0 % 5 == 0 && $0 % 3 != 0 }, { _ in printBuzz() })
    }

    func fizzbuzz(_ printFizzBuzz: () -> Void) {
        run({ $0 % 15 == 0 }, { _ in printFizzBuzz() })
    }

    func number(_ printNumber: (Int) -> Void) {
        run({ $0 % 3 != 0 && $0 % 5 != 0 }, printNumber)
    }
}
