//
//  main.swift
//  220414_1
//
//  Created by Park Gyurim on 2022/04/14.
//
//  내적
//  https://programmers.co.kr/learn/courses/30/lessons/70128?language=swift
//

import Foundation

//func solution(_ a:[Int], _ b:[Int]) -> Int {
//    return a.indices.reduce(0) { (result : Int, index : Int) -> Int in
//        return a[index] * b[index] + result
//    }
//}

// Type inference, Omit return type
//func solution(_ a:[Int], _ b:[Int]) -> Int {
//    return a.indices.reduce(0) { result, index in
//        return a[index] * b[index] + result
//    }
//}

func solution(_ a:[Int], _ b:[Int]) -> Int {
    return a.indices.reduce(0) { a[$1] * b[$1] + $0 }
}

// Popular solution in Programmers
//func solution(_ a:[Int], _ b:[Int]) -> Int {
//    return zip(a, b).map(*).reduce(0, +)
//}


print(solution([1,2,3,4], [-3,-1,0,2]))
print(solution([-1,0,1], [1,0,-1]))
