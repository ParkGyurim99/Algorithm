//
//  main.swift
//  220427_5
//
//  Created by Park Gyurim on 2022/04/28.
//
//  문자열 다루기 기본
//  https://programmers.co.kr/learn/courses/30/lessons/12918
//

import Foundation

func solution(_ s:String) -> Bool {
    (s.count == 4 || s.count == 6) && Int(s) != nil
}

print(solution("a234"), false)
print(solution("1234"), true)
