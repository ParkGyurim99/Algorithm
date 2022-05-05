//
//  main.swift
//  2019 KAKAO WINTER INTERNSHIP - 3
//
//  Created by Park Gyurim on 2022/05/05.
//
//  2019 카카오 개발자 겨울 인턴십 : 불량 사용자
//  https://programmers.co.kr/learn/courses/30/lessons/64064
//

import Foundation

func compare(str1 : String, str2 : String) -> Bool {
    if str1.count != str2.count { return false }
    let temp1 = str1.map { String($0) }
    let temp2 = str2.map { String($0) }
    
    for i in 0..<temp1.count {
        if temp2[i] == "*" { continue }
        if temp1[i] != temp2[i] { return false }
    }
    
    return true
}

func solution(_ user_id:[String], _ banned_id:[String]) -> Int {
    var bannedCount : [String : Int] = [:]
    banned_id.forEach { bannedCount[$0] = 0 }

    for id in user_id {
        for bId in banned_id {
            if compare(str1: id, str2: bId) {
                bannedCount[bId]! += 1
            }
        }
    }
    print(bannedCount)

    return bannedCount.reduce(1) { result, dict in dict.value != 0 ? result * dict.value : result }
}

print(solution(["frodo", "fradi", "crodo", "abc123", "frodoc"], ["fr*d*", "abc1**"]), 2)
print(solution(["frodo", "fradi", "crodo", "abc123", "frodoc"], ["*rodo", "*rodo", "******"]), 2)
print(solution(["frodo", "fradi", "crodo", "abc123", "frodoc"], ["fr*d*", "*rodo", "******", "******"]), 3)
