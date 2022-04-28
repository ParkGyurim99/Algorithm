//
//  main.swift
//  220428_11
//
//  Created by Park Gyurim on 2022/04/28.
//
//  정수 제곱근 판별
//  https://programmers.co.kr/learn/courses/30/lessons/12934
//

import Foundation

func solution(_ n:Int64) -> Int64 {
    let rootN = Int64(sqrt(Double(n)))
    return  rootN * rootN == n ? (rootN + 1) * (rootN + 1) : -1
}

print(solution(121), 144)
print(solution(3), -1)
