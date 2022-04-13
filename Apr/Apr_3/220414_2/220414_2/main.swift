//
//  main.swift
//  220414_2
//
//  Created by Park Gyurim on 2022/04/14.
//
//  나누어 떨어지는 숫자 배열
//  https://programmers.co.kr/learn/courses/30/lessons/12910
//

import Foundation

func solution(_ arr:[Int], _ divisor:Int) -> [Int] {
    let answer = arr.sorted().filter { $0 % divisor == 0 }
    return answer.isEmpty ? [-1] : answer
}

print(solution([5,9,7,10], 5))
print(solution([2,23,1,3], 1))
print(solution([3,2,6], 10))
