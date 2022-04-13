//
//  main.swift
//  220405_1
//
//  Created by Park Gyurim on 2022/04/05.
//
// https://programmers.co.kr/learn/courses/30/lessons/87390
//

import Foundation

func solution(_ n:Int, _ left:Int64, _ right:Int64) -> [Int64] {
    var answer : [Int64] = []
    for i in left...right {
        answer.append(getNum(index: Int64(i), n: Int64(n)))
    }
    
    return answer
}

func getNum(index : Int64, n : Int64) -> Int64 {
    let row = index / n
    let col = index % n
    
    if col > row { return col + 1 }
    else { return row + 1 }
}

print(solution(3, 2, 5))
print(solution(4, 7, 14))
