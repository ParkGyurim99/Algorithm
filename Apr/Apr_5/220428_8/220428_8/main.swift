//
//  main.swift
//  220428_8
//
//  Created by Park Gyurim on 2022/04/28.
//

import Foundation

func solution(_ n:Int) -> Int {
    n == 0 ? 0 : Array(1...n).reduce(0) { n % $1 == 0 ? $0 + $1 : $0 }
}

//print(solution(12),28)
//print(solution(5),6)
print(solution(0))
