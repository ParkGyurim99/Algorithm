//
//  main.swift
//  220428_12
//
//  Created by Park Gyurim on 2022/04/29.
//
//  제일 작은 수 제거하기
//  https://programmers.co.kr/learn/courses/30/lessons/12935
//

import Foundation

func solution(_ arr:[Int]) -> [Int] {
    if arr.count == 1 {
        return  [-1]
    } else {
        var temp = arr
        temp.remove(at: temp.firstIndex(of: temp.min()!)!)
        return temp
    }
}

print(solution([4,3,2,1]),"[4, 3, 2]")
print(solution([10]),"[-1]")
