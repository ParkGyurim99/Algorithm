//
//  main.swift
//  220429_2
//
//  Created by Park Gyurim on 2022/04/29.
//
//  평균 구하기
//  https://programmers.co.kr/learn/courses/30/lessons/12944
//

import Foundation

func solution(_ arr:[Int]) -> Double {
    return Double(arr.reduce(0, +))/Double(arr.count)
}

print(solution([1,2,3,4]), 2.5)
print(solution([5,5]), 5)
