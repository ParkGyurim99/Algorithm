//
//  main.swift
//  220427_3
//
//  Created by Park Gyurim on 2022/04/27.
//
//  문자열 내 p와 y의 개수
//  https://programmers.co.kr/learn/courses/30/lessons/12916
//

import Foundation

func solution(_ s:String) -> Bool {
    s.map{String($0)}.reduce(0) { ($1 == "p" || $1 == "P") ? $0 + 1 : $0 }
    == s.map{String($0)}.reduce(0) { ($1 == "y" || $1 == "Y") ? $0 + 1 : $0 }
}

print(solution("pPoooyY"), true)
print(solution("Pyy"), false)


// Popular solution
/*
 
 func solution(_ s:String) -> Bool {
     let string = s.lowercased()
     return string.components(separatedBy: "p").count == string.components(separatedBy: "y").count
 }
 
 func solution(_ s:String) -> Bool {
    return s.lowercased().filter { $0 == "p" }.count == s.lowercased().filter { $0 == "y" }.count
 }
 
*/
