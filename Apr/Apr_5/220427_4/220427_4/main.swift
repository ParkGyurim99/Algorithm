//
//  main.swift
//  220427_4
//
//  Created by Park Gyurim on 2022/04/28.
//
//  문자열 내림차순으로 배치하기
//  https://programmers.co.kr/learn/courses/30/lessons/12917
//

import Foundation

func solution(_ s:String) -> String {
    return String(s.sorted{ $0 > $1 })
}

print(solution("Zbcdefg"), "gfedcbZ")
