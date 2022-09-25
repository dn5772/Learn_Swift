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
    var gemCount = gems.count
    var tuple: (Int, Int) = (0, gemCount)
    
//    print(type(of : gems[start]))
    
    while (end < gemCount) || (start < gemCount) {
        var checkCnt = counting(dictionary, sets)
        if ( checkCnt == count){
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
