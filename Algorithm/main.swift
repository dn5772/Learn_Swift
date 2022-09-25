import Foundation

func counting(_ d : Dictionary<String, Int>, _ sets :Set<String>) -> Int{
    var cnt = 0
    for set in sets {
        if d[set] != 0{
            cnt += 1
        }
    }
    return cnt
}

func solution(_ gems:[String]) -> [Int] {
    var sets :Set<String> = []
    var ans :[Int] = []
    var dictionary :Dictionary<String, Int> = [:]
    
    for s in gems{
        if (!sets.contains(s)){
            sets.insert(s)
            dictionary[s] = 0
        }
    }
    
    var start: Int = 0, end: Int = 0
    var count = sets.count
    
    while (end <= count) && (start < count) {
        
    }
    
    ans.append(start+1)
    ans.append(end)
    
    return ans
}

print(solution(["DIA", "RUBY", "RUBY", "DIA", "DIA", "EMERALD", "SAPPHIRE", "DIA"]))
