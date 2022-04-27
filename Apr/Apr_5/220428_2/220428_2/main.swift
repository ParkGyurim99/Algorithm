//
//  main.swift
//  220428_2
//
//  Created by Park Gyurim on 2022/04/28.
//
//  소수 찾기
//  https://programmers.co.kr/learn/courses/30/lessons/12921
//

import Foundation

func isPrime(_ n : Int) -> Bool {
    if [2,3].contains(n) { return true }
    for i in 2...Int(sqrt(Double(n))) { if n % i == 0 { return false } }
    return true
}

func solution(_ n:Int) -> Int {
    return Array(2...n).reduce(0) { isPrime($1) ? $0 + 1 : $0 }
}

//print(solution(10), 4)
print(solution(5), 3)
