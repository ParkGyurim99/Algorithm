//
//  main.swift
//  220428_3
//
//  Created by Park Gyurim on 2022/04/28.
//
//  수박수박수박수박수박수?
//  https://programmers.co.kr/learn/courses/30/lessons/12922
//

import Foundation

func solution(_ n:Int) -> String {
    Array(0..<n).map { return $0 % 2 == 0 ? "수" : "박" }.joined()
}

print(solution(3))
print(solution(4))
