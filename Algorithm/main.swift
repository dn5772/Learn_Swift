import Foundation

func solution(_ tickets:[[String]]) -> [String] {
    var result: [String] = []
    
    let sortedTickets = tickets.sorted(by: {(v1:[String], v2:[String])->Bool in
        if v1[0] == v2[0]{return v1[1] < v2[1]}
        return v1[0] < v2[0]
    })

    result.append("ICN")
    
    func travle(_ arr: [[String]], _ startCity: String){
        if result.count == tickets.count+1{
            return
        }
        if !arr.isEmpty {
            for (index, city) in arr.enumerated(){
                if city[0] == startCity{
                    if arr.contains(where: {$0[0]==city[1]})||arr.count==1{
                        var newArr = arr
                        newArr.remove(at: index)
                        result.append(city[1])
                        travle(newArr, city[1])
                        if result.count != tickets.count+1{
                            result.removeLast()
                        }
                    }
                }
            }
        }
    }
    
    travle(sortedTickets, "ICN")
    
    return result
}

print(solution([["ICN", "A"], ["A", "B"], ["A", "C"], ["C", "A"], ["B", "D"]]))
