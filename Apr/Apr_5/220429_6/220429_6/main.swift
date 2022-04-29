//
//  main.swift
//  220429_6
//
//  Created by Park Gyurim on 2022/04/29.
//

import Foundation

func solution(_ x:Int, _ n:Int) -> [Int64] {
    Array(1...n).map { Int64(x * $0) }
}

print(solution(2, 5))
print(solution(4, 3))
print(solution(-4, 2))
