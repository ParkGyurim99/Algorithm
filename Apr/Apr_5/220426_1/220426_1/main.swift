//
//  main.swift
//  220426_1
//
//  Created by Park Gyurim on 2022/04/26.
//
//  나머지가 1이 되는 수 찾기
//  https://programmers.co.kr/learn/courses/30/lessons/87389
//

import Foundation

func solution(_ n:Int) -> Int {
    for i in (2..<n).reversed() { if n % i == 1 { return i } }
    return 0
}

print(solution(12))
