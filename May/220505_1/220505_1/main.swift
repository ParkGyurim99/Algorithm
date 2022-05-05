//
//  main.swift
//  220505_1
//
//  Created by Park Gyurim on 2022/05/05.
//
//  삼각 달팽이
//  https://programmers.co.kr/learn/courses/30/lessons/68645
//

import Foundation

func solution(_ n:Int) -> [Int] {
    var temp = Array(repeating: Array(repeating: 0, count: n), count: n)
    var N = n, i = 1
    var row = 0, col = 0
    
    while true {
        Array(0..<N).forEach { _ in
            temp[row][col] = i
            row += 1
            i += 1
        }
        if N == 0 { break }
        else {
            N -= 1
            row -= 1
            col += 1
        }
        
        Array(0..<N).forEach { _ in
            temp[row][col] = i
            col += 1
            i += 1
        }
        if N == 0 { break }
        else {
            N -= 1
            row -= 1
            col -= 2
        }
        
        Array(0..<N).forEach { _ in
            temp[row][col] = i
            row -= 1
            col -= 1
            i += 1
        }
        
        if N == 0 { break }
        else {
            N -= 1
            row += 2
            col += 1
        }
    }
    
    return Array(1...n).reduce(Array<Int>()){$0 + temp[$1 - 1][0..<$1]}
}

print(solution(4))
print(solution(5))
print(solution(6))
