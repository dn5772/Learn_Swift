import Foundation

struct Stack {
    private var array: [Int] = []

    mutating func push(_ element: Int) {
        array.append(element)
        print(element)
    }

    mutating func pop() -> Int? {
        return array.popLast()
    }

    func touch() -> Int? {
        guard let top = array.last else { return nil }
        return top
    }
}

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var num:Int = board.count
    var ans:Int = 0
    var board2:[[Int]] = board
    
    var stack:Stack = Stack.init()
    stack.push(0)
    
    for i in moves{
        for j in 0..<num{
            if board2[j][i-1] != 0{
                
                if board2[j][i-1] == stack.touch(){
                    print(stack.touch())
                    stack.pop()
                    ans+=2
                }
                else{
                    stack.push(board2[j][i-1])
                    
                }
                board2[j][i-1] = 0
                break
            }
        }
    }
    return ans
}

var board:[[Int]] = [[0, 0, 0, 0, 0], [0, 0, 1, 0, 3], [0, 2, 5, 0, 1], [4, 2, 4, 4, 2], [3, 5, 1, 3, 1]]
var moves:[Int] = [1, 5, 3, 5, 1, 2, 1, 4]

