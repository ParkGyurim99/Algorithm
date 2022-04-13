//
//  main.swift
//  220414_4
//
//  Created by Park Gyurim on 2022/04/14.
//
//  가운데 글자 가져오기
//  https://programmers.co.kr/learn/courses/30/lessons/12903
//

import Foundation

func solution(_ s:String) -> String {
    let source = s.map { String($0) }
    return s.count % 2 == 0 ? source[s.count/2 - 1...s.count/2].joined() : source[s.count/2]
}

print(solution("abcde")) // c 2
print(solution("qwer")) // we 1,2
