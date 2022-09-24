import Foundation

extension String {
    func remove(target string: String) -> String {
        return components(separatedBy: string).joined()
    }
}

let ascending: (Substring, Substring) -> Bool = {(lhs, rhs) in
    return lhs.count < rhs.count
}

func solution(_ s:String) -> [Int] {
    var str :String = s
    
    str = str.remove(target: "},")
    str = str.remove(target: "}}")
    
    var strList = str.split(separator: "{")
    strList.sort(by: ascending)
    
    var intList :[[Int]] = []
    var ans :[Int] = []
    
    for subStr in strList {
        var arr = subStr.split(separator: ",")
        intList.append(arr.map { Int($0)!})
    }
    
    for arr in intList{
        for itme in arr{
            if (!ans.contains(itme)){
                ans.append(itme)
            }
        }
    }
    return ans
}

//print(
//    solution("{{2},{2,1,3,4,5},{2,1},{2,1,3},{2,1,3,4}}")
//)
