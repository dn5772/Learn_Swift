import Foundation

class Queue<T> {
    var enQueue: [T]
    var deQueue: [T] = []
    
    var count: Int {
        return enQueue.count + deQueue.count
    }
    var isEmpty: Bool {
        return enQueue.isEmpty && deQueue.isEmpty
    }
    var touch: T {
        if deQueue.isEmpty {
            deQueue = enQueue.reversed()
            enQueue.removeAll()
        }
        return deQueue.last!
    }
    init(_ queue: [T]) {
        self.enQueue = queue
    }
    func push(_ element: T) {
        enQueue.append(element)
    }
    func pop() -> T {
        if deQueue.isEmpty {
            deQueue = enQueue.reversed()
            enQueue.removeAll()
        }
        return deQueue.popLast()!
    }
}
