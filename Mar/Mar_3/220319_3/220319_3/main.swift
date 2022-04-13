//
//  main.swift
//  220319_3
//
//  Created by Park Gyurim on 2022/03/19.
//

import Foundation

//func solution(_ tickets:[[String]]) -> [String] {
//    var ticketsCopy = tickets.sorted { arr1, arr2 in
//        if arr1[0] == arr2[0] { return arr1[1] < arr2[1] }
//        else { return false }
//    }
//    var cur = "ICN"
//    var route : [String] = [cur]
//    while !ticketsCopy.isEmpty {
//        for index in ticketsCopy.indices {
//            if ticketsCopy[index][0] == cur {
//                let temp = ticketsCopy.remove(at: index)
//                route.append(temp[1])
//                cur = temp[1]
//                break
//            }
//        }
//
//    }
//
//    return route
//}

func solution(_ tickets:[[String]]) -> [String] {
    var answer : [[String]] = []
    
    func dfs(cur : String, route : [String], tickets : [[String]]) {
        if tickets.isEmpty {
            answer.append(route)
            return
        }
        var nextDest = ""
        
        for index in tickets.indices {
            if tickets[index][0] == cur {
                nextDest = tickets[index][1]
                
                var tempRoute = route
                tempRoute.append(nextDest)
                var tempTicket = tickets
                tempTicket.remove(at: index)
                dfs(cur : tickets[index][1], route: tempRoute, tickets: tempTicket)
            }
        }
        
        if nextDest == "" { return }
    }
    
    dfs(cur : "ICN", route: ["ICN"], tickets: tickets)
    
    answer.sort { arr1, arr2 in
        let temp1 = arr1.joined()
        let temp2 = arr2.joined()
        if temp1 < temp2 { return true }
        else { return false }
    }
    
    return answer[0]
}

//print(solution([["ICN", "JFK"], ["HND", "IAD"], ["JFK", "HND"], ["ICN", "JFK"], ["HND", "IAD"], ["JFK", "HND"], ["IAD", "ICN"]]))
print(solution([["ICN", "SFO"], ["ICN", "ATL"], ["SFO", "ATL"], ["ATL", "ICN"], ["ATL","SFO"]]))
//print(solution([["ICN", "A"], ["A", "C"], ["ICN", "B"], ["B", "ICN"]]), ["ICN", "B", "ICN", "A", "C"])
