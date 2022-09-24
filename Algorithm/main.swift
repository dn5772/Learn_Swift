import Foundation

func solution(_ gems:[String]) -> [Int] {
    var sets :Set<String> = []
    var dictionary :Dictionary<String, Int> = [:]
    
    for (index, s) in gems.enumerated(){
        if (!sets.contains(s)){
            sets.insert(s)
            dictionary[s] = index
        }
    }
    
    
    return []
}

print(solution(["DIA", "RUBY", "RUBY", "DIA", "DIA", "EMERALD", "SAPPHIRE", "DIA"]))
