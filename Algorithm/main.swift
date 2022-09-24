import Foundation

extension String {
    func remove(target string: String) -> String {
        return components(separatedBy: string).joined()
    }
}

func solution(_ s:String) -> [Int] {
    var str :String = s
    
    str = str.remove(target: "},")
    str = str.remove(target: "}}")
    
    var strs = str.split(separator: "{")
    
    print(type(of: strs))
    
    print(strs)

    return []
}

solution("{{2},{2,1},{2,1,3},{2,1,3,4}}")
