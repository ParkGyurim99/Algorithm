//
//  main.swift
//  220428_6
//
//  Created by Park Gyurim on 2022/04/28.
//

import Foundation

func solution(_ s:String) -> String {
    s.components(separatedBy: " ").map {
        let charArr = Array($0)
        return charArr.indices.map {
            if $0 % 2 == 0 { return String(charArr[$0].uppercased()) }
            else { return String(charArr[$0].lowercased()) }
        }.joined()
    }.joined(separator: " ")
}


print(solution("try hello world"))
