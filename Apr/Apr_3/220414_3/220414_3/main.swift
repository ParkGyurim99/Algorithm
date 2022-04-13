//
//  main.swift
//  220414_3
//
//  Created by Park Gyurim on 2022/04/14.
//
//  두 정수 사이의 합
//  https://programmers.co.kr/learn/courses/30/lessons/12912
//

import Foundation

func solution(_ a:Int, _ b:Int) -> Int64 {
    return a > b ? Int64((a*a + a - b*b + b)/2) : Int64((b*b + b - a*a + a)/2)
}

// Using .reduce
//func solution(_ a:Int, _ b:Int) -> Int64 {
//    if a > b { return Int64(Array(b...a).reduce(0, +)) }
//    else if a < b { return Int64(Array(a...b).reduce(0, +)) }
//    else { return Int64(a) }
//}

print(solution(3, 5))
print(solution(3, 3))
print(solution(5, 3))
