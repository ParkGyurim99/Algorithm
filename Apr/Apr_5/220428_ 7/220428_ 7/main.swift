//
//  main.swift
//  220428_ 7
//
//  Created by Park Gyurim on 2022/04/28.
//

import Foundation

func solution(_ n:Int) -> Int {
    String(n).reduce(0) { $0 + Int(String($1))! }
}

print(solution(123))
