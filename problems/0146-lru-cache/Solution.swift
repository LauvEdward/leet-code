class LRUCache {
    class Node {
        var key = 0, val = 0
        var prev: Node?, next: Node?
    }

    let cap: Int
    var map = [Int: Node]()
    let head = Node(), tail = Node()   // hai nút giả; gần head = mới dùng nhất

    init(_ capacity: Int) {
        cap = capacity
        head.next = tail
        tail.prev = head
    }

    func remove(_ n: Node) {
        n.prev!.next = n.next
        n.next!.prev = n.prev
    }

    func addFront(_ n: Node) {
        n.next = head.next
        n.prev = head
        head.next!.prev = n
        head.next = n
    }

    func get(_ key: Int) -> Int {
        guard let n = map[key] else { return -1 }
        remove(n)
        addFront(n)
        return n.val
    }

    func put(_ key: Int, _ value: Int) {
        if let n = map[key] {
            n.val = value
            remove(n)
            addFront(n)
            return
        }
        if map.count == cap {
            // bỏ phần tử lâu chưa dùng nhất (sát tail)
            let old = tail.prev!
            remove(old)
            map[old.key] = nil
        }
        let n = Node()
        n.key = key
        n.val = value
        map[key] = n
        addFront(n)
    }
}
