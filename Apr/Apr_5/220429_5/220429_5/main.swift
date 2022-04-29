//
//  main.swift
//  220429_5
//
//  Created by Park Gyurim on 2022/04/29.
//
//  행렬의 덧셈
//  https://programmers.co.kr/learn/courses/30/lessons/12950
//

import Foundation

func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    var answer = arr1
    for i in 0..<arr1.count {
        for j in 0..<arr1[i].count {
            answer[i][j] = arr1[i][j] + arr2[i][j]
        }
    }
    
    return answer
}

/*
 popular solution
 
 func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    return zip(arr1, arr2).map{zip($0,$1).map{$0+$1}}
 }
 
 
 ---
 
 zip(arr1, arr2).forEach {
     zip($0, $1).forEach {
         print($0, $1)
     }
 }
 
*/

print(solution([[1,2],[2,3]],[[3,4],[5,6]]))
