import Foundation

func solution(_ stones:[Int], _ k:Int) -> Int {
    var answer: Int = 0
    var start: Int = 0
    var end: Int = 0
    var max: Int = 0
    var dict: Dictionary<Int, Int> = [:]
    
    for _ in 0..<k{
        if max < stones[end]{
            max = stones[end]
        }
        dict[stones[end], default: 0] += 1
        end += 1
    }
    answer = max
    
    for _ in k..<stones.count{
        dict[stones[end], default: 0] += 1
        dict[stones[start], default: 0] -= 1
        if dict[stones[start]] == 0 {
            dict.removeValue(forKey: stones[start])
        }
        
        start += 1
        end += 1
        
        if max < answer{
            answer = max
        }
    }
    return answer
}

print(solution([2, 4, 5, 3, 2, 1, 4, 2, 5, 1], 3))
