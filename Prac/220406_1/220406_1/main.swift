//
//  main.swift
//  220406_1
//
//  Created by Park Gyurim on 2022/04/06.
//
//  https://programmers.co.kr/learn/courses/30/lessons/12939
//

import Foundation

@discardableResult
func solution(_ s:String) -> String {
    let source = s.components(separatedBy: " ").compactMap{ Int($0) }
    
    return "\(source.min()!) \(source.max()!)"
}

print(solution("1 2 3 4"))
print(solution("-1 -2 -3 -4"))
print(solution("-1 -1"))
