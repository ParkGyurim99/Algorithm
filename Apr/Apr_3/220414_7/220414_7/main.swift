//
//  main.swift
//  220414_7
//
//  Created by Park Gyurim on 2022/04/14.
//
//  없는 숫자 더하기
//  https://programmers.co.kr/learn/courses/30/lessons/86051
//

import Foundation

func solution(_ numbers:[Int]) -> Int {
    return Set(0..<10).subtracting(Set(numbers)).reduce(0, +)
}

// 신기한 풀이
//func solution(_ numbers:[Int]) -> Int {
//    return 45-numbers.reduce(0, +)
//}


print(solution([1,2,3,4,6,7,8,0]))
