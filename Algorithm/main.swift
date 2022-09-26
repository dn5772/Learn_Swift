import Foundation

func typeCounting(_ d : Dictionary<String, Int>, _ s :Set<String>) -> Int{
    var cnt = 0
    for set in s {
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
    
    for gem in gems{
        if (!sets.contains(gem)){
            sets.insert(gem)
            dictionary[gem] = 0
        }
    }
    
    var start: Int = 0, end: Int = 0
    let gemType = sets.count
    let gemCount = gems.count
    var tuple: (Int, Int) = (0, gemCount)
    
    while (end < gemCount) || (start < gemCount) {
        if (typeCounting(dictionary, sets) == gemType){
            if (end - start) < (tuple.1 - tuple.0) {
                tuple.0 = start
                tuple.1 = end
            }
            dictionary[gems[start]] = dictionary[gems[start]]! - 1
            start += 1
        }
        else if end == gemCount {
            dictionary[gems[start]] = dictionary[gems[start]]! - 1
            start += 1
        }
        else {
            dictionary[gems[end]] = dictionary[gems[end]]! + 1
            end += 1
        }
    }
    
    ans.append(tuple.0 + 1)
    ans.append(tuple.1)
    
    return ans
}

print(solution(["DIA", "RUBY", "RUBY", "DIA", "DIA", "EMERALD", "SAPPHIRE", "DIA"]))
