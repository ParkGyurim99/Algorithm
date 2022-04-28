//
//  main.swift
//  220428_13
//
//  Created by Park Gyurim on 2022/04/29.
//
//  짝수와 홀수
//  https://programmers.co.kr/learn/courses/30/lessons/12937
//

import Foundation

func solution(_ num:Int) -> String {
    return num % 2 == 0 ? "Even" : "Odd"
}

print(solution(3))
print(solution(4))
print(solution(0))
print(solution(-1))
