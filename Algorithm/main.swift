import Foundation


func solution(_ gems:[String]) -> [Int] {
    var dictionary :Dictionary<String, Int> = [:]
    let sets = Set(gems)
    
    var end: Int = 0
    let gemType = sets.count
    let gemCount = gems.count
    var tuple: (Int, Int) = (0, gemCount)
    
    dictionary[gems[0], default: 0] += 1
    for (start, gem) in gems.enumerated() {
        while (end < gemCount-1) && (dictionary.count != gemType){
            end += 1
            dictionary[gems[end], default: 0] += 1
        }
    
        if (dictionary.count == gemType) {
            if (end - start) < (tuple.1 - tuple.0){
                tuple.0 = start
                tuple.1 = end
            }
        }
        
        dictionary[gem, default: 0] -= 1
        if dictionary[gem] == 0{
            dictionary.removeValue(forKey: gem)
        }
        
    }
    
    return [tuple.0 + 1, tuple.1 + 1]
}

print(solution(["DIA", "RUBY", "RUBY", "DIA", "DIA", "EMERALD", "SAPPHIRE", "DIA"]))
