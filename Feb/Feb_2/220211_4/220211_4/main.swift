//
//  main.swift
//  220211_4
//
//  Created by Park Gyurim on 2022/02/11.
//

import Foundation

func factorial(_ n : Int) -> Int {
    if n == 0 { return 1 }
    else { return n * factorial(n - 1) }
}

func solution(_ n : Int) -> Int {
    var ans = 0
    //for i in 0...n/2 { ans += factorial(n - i) / (factorial(i) * factorial(n - 2 * i)) }
    for i in 0...n/2 {
        var temp = 1

        for k in 0..<i { temp *= (n - i) - k }
        if i != 0 {
            for k in 1...i { temp /= k }
        }
        ans += temp
    }
    return ans
}

//func solution(_ n : Int) -> Int {
//    var ans = 0
//
//    for i in 0...n/2 {
//        let j = n - 2 * i
//        ans += factorial(i + j) / (factorial(i) + factorial(j))
//    }
//
//    return ans
//}


for i in 1..<13 {
    print("\(i) : \(solution(i))")
}


