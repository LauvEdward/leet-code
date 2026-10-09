import Foundation

class DiningPhilosophers {
    let forks = (0..<5).map { _ in NSLock() }

    func wantsToEat(_ p: Int,
                    _ pickLeftFork: () -> Void,
                    _ pickRightFork: () -> Void,
                    _ eat: () -> Void,
                    _ putLeftFork: () -> Void,
                    _ putRightFork: () -> Void) {
        let l = p, r = (p + 1) % 5
        // luôn khóa nĩa số nhỏ trước -> không thể thành vòng chờ
        let a = min(l, r), b = max(l, r)

        forks[a].lock()
        forks[b].lock()

        pickLeftFork()
        pickRightFork()
        eat()
        putLeftFork()
        putRightFork()

        forks[b].unlock()
        forks[a].unlock()
    }
}
