//
//  main.swift
//  220619#3
//
//  Created by Park Gyurim on 2022/06/19.
//

import Foundation

public func solution(_ M : Int, _ N : Int) -> Int {
    return Int(sqrt(Double(M + N * 4)))
}

print(solution(8, 0))
print(solution(4, 3))
print(solution(1, 0))
print(solution(0, 18))
print(solution(13, 3))
