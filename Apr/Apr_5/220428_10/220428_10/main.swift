//
//  main.swift
//  220428_10
//
//  Created by Park Gyurim on 2022/04/28.
//
//  정수 내림차순으로 배치하기
//  https://programmers.co.kr/learn/courses/30/lessons/12933
//

import Foundation

func solution(_ n:Int64) -> Int64 {
    Int64(String(String(n).sorted{$0 > $1}))!
}

print(solution(118372), 873211)
