import Foundation

class H2O {
    let h = DispatchSemaphore(value: 2)   // còn mấy chỗ cho H trong phân tử hiện tại
    let o = DispatchSemaphore(value: 0)   // số H đã vào, chờ O
    let oLock = NSLock()

    func hydrogen(_ releaseHydrogen: () -> Void) {
        h.wait()
        releaseHydrogen()
        o.signal()
    }

    func oxygen(_ releaseOxygen: () -> Void) {
        // chỉ 1 O được gom H tại một thời điểm, không thì 2 O mỗi đứa giữ 1 H là kẹt
        oLock.lock()
        o.wait()
        o.wait()
        releaseOxygen()
        h.signal()
        h.signal()
        oLock.unlock()
    }
}
