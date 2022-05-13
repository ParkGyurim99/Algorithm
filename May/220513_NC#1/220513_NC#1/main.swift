//
//  main.swift
//  220513_NC#1
//
//  Created by Park Gyurim on 2022/05/13.
//
//  NC 문자열
//  https://www.acmicpc.net/problem/17301
//

import Foundation

//func factorial(_ n : Int) -> Int { n == 0 ? 1 : n * factorial(n - 1) }

var n : Int = Int(readLine()!)!
var strings : [String] = (0..<n).map { _ in readLine(strippingNewline: true)! }

func solution(_ n : Int, _ strings : [String]) -> Int {
    var ncDict : [String : Int] = ["N" : 0, "C" : 0, "NC" : 0, "CN" : 0]
    strings.forEach {
        if $0.contains("N") && $0.contains("C") {
            if $0.firstIndex(of: "N")! > $0.lastIndex(of : "C")! { ncDict["CN"]! += 1 }
            else { ncDict["NC"]! += 1 }
        }
        else if $0.contains("N") { ncDict["N"]! += 1 }
        else if $0.contains("C") { ncDict["C"]! += 1 }
    }
    let N : Int = ncDict["N"]!, C : Int = ncDict["C"]!, CN : Int = ncDict["CN"]!
    var answer = (1...n).reduce(0) { $0 + ($1...n).reduce(1) { $1 * $0 % 1000000007 } }
    
    var tempN = 0, tempC = 0, tempCN = 0
    
    if N > 0 { tempN = (1...N).reduce(0) { $0 + ($1...N).reduce(1) { $0 * $1 % 1000000007 } } } // N으로만 구성
    if C > 0 { tempC = (1...C).reduce(0) { $0 + ($1...C).reduce(1) { $0 * $1 % 1000000007 } } } // C로만 구성
    if CN > 0 { tempCN = (1...CN).reduce(0) { $0 + ($1...CN).reduce(1) { $0 * $1 % 1000000007 } } } // CN으로 구성
    print(answer, ncDict["NC"]!, tempN, tempC, tempCN)
    answer -= (tempN + tempC + tempN * tempC + tempC * tempCN + tempCN + tempCN * tempN) // N + C + N * C
    
    return answer % 1000000007
}

//print(solution(4, ["NEVER", "ENDING", "CHANGE", "NCSOFT"]), 55)
//print(solution(3, ["NC", "NCNC", "NCNCNCN"]), 15)

print(solution(n, strings))
