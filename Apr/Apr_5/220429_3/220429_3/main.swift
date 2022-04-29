//
//  main.swift
//  220429_3
//
//  Created by Park Gyurim on 2022/04/29.
//
//  하샤드 수
//  https://programmers.co.kr/learn/courses/30/lessons/12947
//

import Foundation

func solution(_ x:Int) -> Bool {
    x % Array(String(x)).reduce(0) { $0 + Int(String($1))! } == 0
}

print(solution(10), true)
print(solution(12), true)
print(solution(11), false)
print(solution(13), false)
