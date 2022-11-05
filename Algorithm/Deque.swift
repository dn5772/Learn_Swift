import Foundation

class Deque<T> {
    var enQueue: [T]
    var deQueue: [T] = []
    
    var count: Int {
        return enQueue.count + deQueue.count
    }
    var isEmpty: Bool {
        return enQueue.isEmpty && deQueue.isEmpty
    }
    var left: T {
        if deQueue.isEmpty {
            deQueue = enQueue.reversed()
            enQueue.removeAll()
        }
        return deQueue.last!
    }
    var right: T {
        if enQueue.isEmpty {
            enQueue = deQueue.reversed()
            enQueue.removeAll()
        }
        return enQueue.last!
    }
    init(_ queue: [T]) {
        self.enQueue = queue
    }
    func push(_ element: T) {
        enQueue.append(element)
    }
    func pushLeft(_ element: T) {
        deQueue.append(element)
    }
    func pop() -> T? {
        var returnValue: T?
        if enQueue.isEmpty {
            deQueue.reverse()
            returnValue = deQueue.popLast()
            deQueue.reverse()
        } else {
            returnValue = enQueue.popLast()
        }
        return returnValue
    }
    func popLeft() -> T?{
        if deQueue.isEmpty{
            deQueue = enQueue.reversed()
            enQueue.removeAll()
        }
        return deQueue.popLast
    }
}
