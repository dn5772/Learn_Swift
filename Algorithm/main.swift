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
    var dictionary :Dictionary<String, Int> = [:]
    var indexs :[Int] = []
    
    var newGems = gems
    newGems.append("")
    
    for index in 0..<(newGems.count-1){
        let gem = gems[index]
        if (!sets.contains(gem)){
            sets.insert(gem)
            dictionary[gem] = 0
        }
        if gem != newGems[index+1]{
            indexs.append(index)
        }
    }
    
    var end: Int = 0
    var i = 0
    let gemType = sets.count
    let gemCount = gems.count
    var tuple: (Int, Int) = (0, gemCount)
    
    dictionary[gems[0]] = dictionary[gems[0]]! + 1
    
    for start in indexs{
        while (i < (indexs.count - 1)) && (typeCounting(dictionary, sets) != gemType){
            i += 1
            end = indexs[i]
            dictionary[gems[end]] = dictionary[gems[end]]! + 1
        }
        if (typeCounting(dictionary, sets) == gemType) {
            if (end - start) < (tuple.1 - tuple.0){
                tuple.0 = start
                tuple.1 = end
            }
        }
        dictionary[gems[start]] = dictionary[gems[start]]! - 1
    }
    
    return [tuple.0 + 1, tuple.1 + 1]
}

print(solution(["DIA", "RUBY", "RUBY", "DIA", "DIA", "EMERALD", "SAPPHIRE", "DIA"]))
