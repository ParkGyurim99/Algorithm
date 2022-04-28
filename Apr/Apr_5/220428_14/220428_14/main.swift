//
//  main.swift
//  220428_14
//
//  Created by Park Gyurim on 2022/04/29.
//
//  최대공약수와 최소공배수
//  https://programmers.co.kr/learn/courses/30/lessons/12940
//

import Foundation

func solution(_ n:Int, _ m:Int) -> [Int] {
    [Set(Array(1...n).filter { n % $0 == 0 }).intersection(Set(Array(1...m).filter { m % $0 == 0 })).max()!,
     Set(Array(n...n*m).filter { $0 % n == 0 }).intersection(Set(Array(m...n*m).filter { $0 % m == 0 })).min()!]
}

print(solution(3, 12), "[3, 12]")
print(solution(2, 5), "[1, 10]")
