import Foundation

func solution(_ tickets:[[String]]) -> [String] {
    var result: [String] = []
    var sortedTickets = tickets.sorted(by: {(v1:[String], v2:[String])->Bool in
        if v1[0] == v2[0]{return v1[1] < v2[1]}
        return v1[0] < v2[0]
    })
    
    var lastCity: String = "ICN"
    result.append(lastCity)
    
    while !sortedTickets.isEmpty{
        for (index, city) in sortedTickets.enumerated() {
            if city[0] == lastCity{
                result.append(city[1])
                lastCity = city[1]
                sortedTickets.remove(at: index)
                break
            }
        }
    }
    return result
}

print(solution([["ICN", "JFK"], ["HND", "IAD"], ["JFK", "HND"]]))
