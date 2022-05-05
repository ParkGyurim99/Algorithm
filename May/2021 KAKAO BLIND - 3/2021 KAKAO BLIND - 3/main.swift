//
//  main.swift
//  2021 KAKAO BLIND - 3
//
//  Created by Park Gyurim on 2022/05/05.
//

import Foundation

struct information {
    var lang : String
    var stack : String
    var exp : String
    var food : String
    var score : Int
    
    func compare(cond : information) -> Bool {
        if self.score < cond.score { return false }
        else {
            if !(cond.lang == "-" || cond.lang == self.lang) { return false }
            
            if !(cond.stack == "-" || cond.stack == self.stack) { return false }
            
            if !(cond.exp == "-" || cond.exp == self.exp) { return false }
            
            if !(cond.food == "-" || cond.food == self.food) { return false }
            
            return true
        }
    }
}

func solution(_ info:[String], _ query:[String]) -> [Int] {
    var answer = Array(repeating: 0, count: query.count)
    
    let queries : [information] = query.map { q in
        var temp = q.components(separatedBy: " and ")
        let last = temp.removeLast()
        temp += last.components(separatedBy: " ")
        return information(lang: temp[0], stack: temp[1], exp: temp[2], food: temp[3], score: Int(temp[4])!)
    }
    
    for i in info {
        let temp = i.components(separatedBy: " ")
        let tempInfo = information(lang: temp[0], stack: temp[1], exp: temp[2], food: temp[3], score: Int(temp[4])!)
        for j in 0..<queries.count { answer[j] += tempInfo.compare(cond: queries[j]) ? 1 : 0 }
    }
    
    return answer
}

print(
    solution(
        ["java backend junior pizza 150",
         "python frontend senior chicken 210",
         "python frontend senior chicken 150",
         "cpp backend senior pizza 260",
         "java backend junior chicken 80",
         "python backend senior chicken 50"],
        ["java and backend and junior and pizza 100",
         "python and frontend and senior and chicken 200",
         "cpp and - and senior and pizza 250",
         "- and backend and senior and - 150",
         "- and - and - and chicken 100",
         "- and - and - and - 150"]
    ),
    "[1, 1, 1, 1, 2, 4]"
)
