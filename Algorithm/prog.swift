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
        var returnValue: T
        if enQueue.isEmpty {
            deQueue.reverse()
            returnValue = deQueue.last!
            deQueue.reverse()
        } else {
            returnValue = enQueue.last!
        }
        return returnValue
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
        return deQueue.popLast()
    }
}

func solution(_ stones:[Int], _ k:Int) -> Int {
    var answer: Int = 200000000
    let queue: Deque<Int> = Deque<Int>([])
    
    for (end, num) in stones.enumerated(){
        while !queue.isEmpty && (num>stones[queue.right]){
            queue.pop()
        }
        queue.push(end)
        if queue.left==end-k{
            queue.popLeft()
        }
        if end >= k-1 {
            if stones[queue.left] < answer{
                answer = stones[queue.left]
            }
        }
    }
    return answer
}

print(solution([2, 4, 5, 9, 3, 2, 1, 4, 2, 5, 1], 3))
