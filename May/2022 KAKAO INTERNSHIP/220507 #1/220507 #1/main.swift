//
//  main.swift
//  220507 #1
//
//  Created by Park Gyurim on 2022/05/07.
//

import Foundation

func solution(_ survey:[String], _ choices:[Int]) -> String {
    var dict : [String : Int] = [:]
    "RTCFJMAN".forEach { dict[String($0)] = 0 }
    var temp = 0

    for index in 0..<survey.count {
        temp = -4 + choices[index]
        
        if temp < 0 { dict[survey[index].map{String($0)}[0]]! -= temp }
        else { dict[survey[index].map{String($0)}[1]]! += temp }
    }
    
    return [["R", "T"], ["C", "F"], ["J", "M"], ["A", "N"]].map { choice -> String in
        if dict[choice[0]] == dict[choice[1]] { return choice[0] < choice[1] ? choice[0] : choice[1] }
        else { return dict[choice[0]]! > dict[choice[1]]! ? choice[0] : choice[1] }
    }.joined()
}

print(solution(["AN", "CF", "MJ", "RT", "NA"], [5, 3, 2, 7, 5]))
print(solution(["TR", "RT", "TR"], [7, 1, 3]))
