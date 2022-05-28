//
//  main.swift
//  220528_1
//
//  Created by Park Gyurim on 2022/05/28.
//

import Foundation

func solution(_ logs:[String]) -> [String] {
    var users = Set<String>()
    var qDict = Dictionary<String, Int>()//: [String : Int] = [:]
    
    Set(logs).forEach {
        let temp = $0.components(separatedBy: " ")
        users.insert(temp[0])
        if let _ = qDict[temp[1]] { qDict[temp[1]]! += 1 }
        else { qDict[temp[1]] = 1 }
    }
    
    return qDict.filter {
        if users.count % 2 == 0 { return $0.value >= (users.count / 2) }
        else { return $0.value > (users.count / 2) }
    }.keys.sorted()
}

print(solution(["morgan string_compare", "felix string_compare", "morgan reverse", "rohan sort", "andy reverse", "morgan sqrt"]), ["reverse", "string_compare"])
print(solution(["morgan sort", "felix sort", "morgan sqrt", "morgan sqrt", "rohan reverse", "rohan reverse"]), ["sort"])
