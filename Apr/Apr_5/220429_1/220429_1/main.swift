//
//  main.swift
//  220429_1
//
//  Created by Park Gyurim on 2022/04/29.
//
//  콜라스 추측
//  https://programmers.co.kr/learn/courses/30/lessons/12943
//

import Foundation

func solution(_ num:Int) -> Int {
    var number = num, count = 0
    while number != 1 {
        if count > 500 { return -1 }
        
        number = number % 2 == 0 ? number / 2 : number * 3 + 1
        count += 1
    }
    
    return count
}

print(solution(6))
print(solution(626331))
