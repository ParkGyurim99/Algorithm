//
//  main.swift
//  220428_9
//
//  Created by Park Gyurim on 2022/04/28.
//
//  자연수 뒤집어 배열로 만들기
//  https://programmers.co.kr/learn/courses/30/lessons/12932
//

import Foundation

func solution(_ n:Int64) -> [Int] {
    String(n).compactMap{Int(String($0))}.reversed()
}

print(solution(12345))
