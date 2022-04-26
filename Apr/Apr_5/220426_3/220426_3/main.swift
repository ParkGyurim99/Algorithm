//
//  main.swift
//  220426_3
//
//  Created by Park Gyurim on 2022/04/26.
//
//  3진법 뒤집기
//  https://programmers.co.kr/learn/courses/30/lessons/68935
//

import Foundation

func getTernary(_ n : Int) -> [Int] {
    if n == 0 { return [] }
    return getTernary(n / 3) + [n % 3]
}

func solution(_ n:Int) -> Int {
    var answer = 0
    let ternary = getTernary(n)
    var multSoruce = 1
    for i in ternary {
        answer += multSoruce * i
        multSoruce *= 3
    }
    
    return answer
}

print(solution(45))


/*
func solution(_ n:Int) -> Int {
    let flipToThree = String(n,radix: 3) // n을 3진법으로
    let answer = Int(String(flipToThree.reversed()),radix:3)!
    return answer
}
 
# String(n, radix : x) : n 을 x진법으로 변환 -> String

*/
